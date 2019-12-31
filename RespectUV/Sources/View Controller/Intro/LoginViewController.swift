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

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
    self.reactor = reactor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    ui.animate()
  }

  func bind(reactor: Reactor) {
    ui.loginViaKakaoButton.rx.tap
      .map { Reactor.Action.loginViaKakao }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.hasLogin }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in NicknameSettingViewController(reactor: NicknameSettingViewReactor()) }
      .bind(to: rx.push())
      .disposed(by: disposeBag)
  }
}
