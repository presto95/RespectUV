//
//  InfoViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit
import RxDataSources

final class InfoViewController: BaseViewController, View, UIOwner {
  typealias Reactor = InfoViewReactor
  typealias DataSource = RxTableViewSectionedReloadDataSource<InfoSectionModel>

  var ui: InfoViewUI!
  var dataSource: DataSource!

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
    dataSource = .init(configureCell: { _, tableView, indexPath, model in
      let cell = tableView.dequeueReusableCell(InfoCell.self, for: indexPath).then {
        $0.textLabel?.text = model
        $0.accessoryType = .disclosureIndicator
      }
      return cell
    })
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

private extension InfoViewController {
  func nextViewController(withSelectedIndexPath indexPath: IndexPath) -> UIViewController {
    switch (indexPath.section, indexPath.row) {
    case (0, 0):
      return MusicViewController(reactor: MusicViewReactor())
    case (0, 1):
      return CollectionViewController(reactor: CollectionViewReactor())
    default:
      return UIViewController()
    }
  }
}
