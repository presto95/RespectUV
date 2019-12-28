//
//  NicknameSettingViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit

final class NicknameSettingViewController: BaseViewController, View, UIOwner {
  typealias Reactor = NicknameSettingViewReactor

  var ui: NicknameSettingViewUI!

  func bind(reactor: Reactor) {
    if ui == nil {
      ui = .init(owner: self)
    }

    ui.nicknameTextField.rx.text.orEmpty
      .map { Reactor.Action.inputNickname($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    ui.nextButton.rx.tap
      .map { Reactor.Action.tapNextButton }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.isNextButtonSelected }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in
        BPMStandardDefaultsSettingViewController().then {
          $0.reactor = BPMStandardDefaultsSettingViewReactor()
        }
      }
      .bind(to: navigationController!.rx.push())
      .disposed(by: disposeBag)
  }
}
