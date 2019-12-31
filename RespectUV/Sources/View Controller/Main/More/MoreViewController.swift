//
//  MoreViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import Carte
import ReactorKit
import RxDataSources

final class MoreViewController: BaseViewController, View, UIOwner {
  typealias Reactor = MoreViewReactor
  typealias DataSource = RxTableViewSectionedReloadDataSource<MoreSectionModel>

  var ui: MoreViewUI!
  var dataSource: DataSource!

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
    dataSource = .init(configureCell: { _, tableView, indexPath, title in
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath).then {
        $0.textLabel?.text = title
        $0.accessoryType = .disclosureIndicator
      }
      return cell
    })
    dataSource.titleForHeaderInSection = { $0.sectionModels[$1].model }
    self.reactor = reactor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(reactor: Reactor) {
    ui.tableView.rx.itemSelected
      .map { Reactor.Action.tapCell($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sectionModel }
      .bind(to: ui.tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)

    reactor.state.map { $0.selectedIndexPath }
      .compactMap { $0 }
      .do(onNext: { self.ui.tableView.deselectRow(at: $0, animated: true) })
      .map(nextViewController(withSelectedIndexPath:))
      .bind(to: rx.push())
      .disposed(by: disposeBag)
  }
}

private extension MoreViewController {
  func nextViewController(withSelectedIndexPath indexPath: IndexPath) -> UIViewController {
    switch (indexPath.section, indexPath.row) {
    case (0, 0):
      return BPMStandardDefaultsSettingViewController(reactor: BPMStandardDefaultsSettingViewReactor())
    case (0, 1):
      return NicknameChangeViewController(reactor: NicknameChangeViewReactor())
    case (1, 0):
      return CarteViewController()
    default:
      return UIViewController()
    }
  }
}
