//
//  BPMStandardDefaultsSettingViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import ReactorKit

final class BPMStandardDefaultsSettingViewController: BaseViewController, View, UIOwner {
  typealias Reactor = BPMStandardDefaultsSettingViewReactor

  var ui: BPMStandardDefaultsSettingViewUI!

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

    ui.valueSlider.rx.value
      .map { Int($0) }
      .map { Reactor.Action.changeStandardBPM($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    ui.confirmButton.rx.tap
      .map { Reactor.Action.tapConfirmButton }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.standardBPM }
      .map { Float($0) }
      .bind(to: ui.valueSlider.rx.value)
      .disposed(by: disposeBag)

    reactor.state.map { $0.standardBPM }
      .map { "BPM \($0)" }
      .bind(to: ui.valueLabel.rx.text)
      .disposed(by: disposeBag)

    reactor.state.map { $0.viewWillPop }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in Void() }
      .bind(to: rx.pop())
      .disposed(by: disposeBag)
  }
}
