//
//  NicknameSettingViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit
import RxSwift
import RxViewController

final class NicknameSettingViewController: BaseViewController, View, UIOwner {
  typealias Reactor = NicknameSettingViewReactor

  var ui: NicknameSettingViewUI!

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
    self.reactor = reactor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(reactor: Reactor) {
    rx.viewDidAppear
      .map { _ in Reactor.Action.viewDidAppear }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    ui.nicknameTextField.rx.text.orEmpty
      .map { Reactor.Action.inputNickname($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    ui.confirmButton.rx.tap
      .map { Reactor.Action.tapConfirmButton }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    ui.viewTapGestureRecognizer.rx.event
      .map { _ in Reactor.Action.tapView }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.keyboardWillPresent }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in Void() }
      .observeOn(MainScheduler.instance)
      .bind(to: ui.nicknameTextField.rx.becomeFirstResponder)
      .disposed(by: disposeBag)

    reactor.state.map { $0.keyboardWillDismiss }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in Void() }
      .observeOn(MainScheduler.instance)
      .bind(to: ui.nicknameTextField.rx.resignFirstResponder)
      .disposed(by: disposeBag)

    reactor.state.map { $0.viewWillPresentMainView }
      .distinctUntilChanged()
      .filter { $0 }
      .map { _ in
        MainTabBarController().then {
          $0.modalPresentationStyle = .fullScreen
          $0.modalTransitionStyle = .flipHorizontal
        }
      }
      .bind(to: rx.present())
      .disposed(by: disposeBag)

    reactor.state.map { $0.isConfirmButtonEnabled }
      .distinctUntilChanged()
      .bind(to: ui.confirmButton.rx.isEnabled)
      .disposed(by: disposeBag)
  }
}
