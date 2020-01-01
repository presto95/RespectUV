//
//  MainTunesChangeViewController.swift
//  RespectUV
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

import UIKit

import ReactorKit

final class MainTunesChangeViewController: BaseViewController, View, UIOwner {
  typealias Reactor = MainTunesChangeViewReactor

  var ui: MainTunesChangeViewUI!

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
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

    ui.tunesPickerView.rx.itemSelected
      .map { Reactor.Action.changeRow($0.row) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.titles }
      .bind(to: ui.tunesPickerView.rx.itemTitles) { $1 }
      .disposed(by: disposeBag)

    reactor.state.map { $0.selectedRow }
      .subscribe(onNext: { [weak ui] row in
        ui?.tunesPickerView.selectRow(row, inComponent: 0, animated: false)
      })
      .disposed(by: disposeBag)
  }
}
