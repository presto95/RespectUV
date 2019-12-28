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

  override func loadView() {
    ui = .init(owner: self)
  }

  func bind(reactor: Reactor) {
    ui.slider.rx.value
      .map { Int($0) }
      .map { Reactor.Action.changeStandardBPM($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    ui.nextButton.rx.tap
      .map { Reactor.Action.tapNextButton }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.isNextButtonSelected }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in FinishViewController() }
      .bind(to: navigationController!.rx.push())
      .disposed(by: disposeBag)
  }
}
