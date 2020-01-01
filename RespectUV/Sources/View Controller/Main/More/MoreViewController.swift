//
//  MoreViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import MessageUI
import UIKit

import Carte
import ReactorKit
import RxDataSources

final class MoreViewController: BaseViewController, View, UIOwner {
  typealias Reactor = MoreViewReactor
  typealias DataSource = RxTableViewSectionedReloadDataSource<MoreSectionModel>

  var ui: MoreViewUI!
  var dataSource: DataSource!

  lazy var mailComposer = MFMailComposeViewController()

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
    dataSource = .init(configureCell: { _, tableView, indexPath, model in
      let cell = tableView.dequeueReusableCell(MoreCell.self, for: indexPath).then {
        $0.textLabel?.text = model.text
        $0.detailTextLabel?.text = model.detail
        $0.accessoryType = .disclosureIndicator
      }
      return cell
    })
    dataSource.titleForHeaderInSection = { $0.sectionModels[$1].header }
    mailComposer = MFMailComposeViewController().then {
      $0.setSubject("[RespectUV] 피드백")
      $0.setToRecipients(["yoohan95@gmail.com"])
    }
    self.reactor = reactor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(reactor: Reactor) {
    rx.viewWillAppear
      .map { _ in Reactor.Action.viewWillAppear }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    ui.tableView.rx.itemSelected
      .map { Reactor.Action.tapCell($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    mailComposer.rx.result
      .map { Reactor.Action.sendMail($0) }
      .asObservable()
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sectionModel }
      .bind(to: ui.tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)

    let selectedIndexPathState = reactor.state.map { $0.selectedIndexPath }
      .compactMap { $0 }
      .do(onNext: { self.ui.tableView.deselectRow(at: $0, animated: true) })
      .map(nextViewController(withSelectedIndexPath:))
      .share()

    selectedIndexPathState
      .filter { $0.1 == .modal }
      .map { $0.0 }
      .bind(to: rx.present())
      .disposed(by: disposeBag)

    selectedIndexPathState
      .filter { $0.1 == .navigation }
      .map { $0.0 }
      .bind(to: rx.push())
      .disposed(by: disposeBag)

    let mailResultState = reactor.state.map { $0.mailResult }
      .compactMap { $0 }
      .share()

    mailResultState
      .compactMap { $0.success }
      .subscribe(onNext: { result in
        Log.debug(result)
      })
      .disposed(by: disposeBag)

    mailResultState
      .compactMap { $0.failure }
      .subscribe(onNext: { result in
        Log.error(result)
      })
      .disposed(by: disposeBag)
  }
}

private extension MoreViewController {
  func nextViewController(withSelectedIndexPath indexPath: IndexPath) -> (UIViewController, PresentationType) {
    switch (indexPath.section, indexPath.row) {
    case (0, 0):
      return (BPMStandardDefaultsSettingViewController(reactor: BPMStandardDefaultsSettingViewReactor()), .navigation)
    case (0, 1):
      return (MainTunesChangeViewController(reactor: MainTunesChangeViewReactor()), .navigation)
    case (0, 2):
      return (NicknameChangeViewController(reactor: NicknameChangeViewReactor()), .navigation)
    case (1, 0):
      return (UIViewController(), .navigation)
    case (1, 1):
      return (mailComposer, .modal)
    case (2, 0):
      return (CarteViewController(), .navigation)
    default:
      return (UIViewController(), .navigation)
    }
  }
}
