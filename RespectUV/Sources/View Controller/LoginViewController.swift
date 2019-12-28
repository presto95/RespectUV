//
//  LoginViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit

final class LoginViewController: BaseViewController, View, UIOwner {
  typealias Reactor = LoginViewReactor

  var ui: LoginViewUI!

  func bind(reactor: Reactor) {
    if ui == nil {
      ui = .init(owner: self)
    }

    ui.loginViaKakaoButton.rx.tap
      .map { Reactor.Action.loginViaKakao }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.hasLogin }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in
        NicknameSettingViewController().then {
          $0.reactor = NicknameSettingViewReactor()
        }
      }
      .bind(to: navigationController!.rx.push())
      .disposed(by: disposeBag)
  }
}
