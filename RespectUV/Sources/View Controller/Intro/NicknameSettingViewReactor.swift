//
//  NicknameSettingViewReactor.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import ReactorKit
import RxSwift

final class NicknameSettingViewReactor: Reactor {
  enum Action {
    case viewDidAppear
    case tapView
    case inputNickname(String)
    case tapConfirmButton
  }

  enum Mutation {
    case setKeyboardPresenting(Bool)
    case setKeyboardDismissing(Bool)
    case setNickname(String)
    case saveNickname
    case setSettingFinished
    case presentMainView(Bool)
    case setConfirmButtonEnabled(Bool)
  }

  struct State {
    var nickname = ""
    var keyboardWillPresent = false
    var keyboardWillDismiss = false
    var viewWillPresentMainView = false
    var isConfirmButtonEnabled = false
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .viewDidAppear:
      return .from([
        .setKeyboardPresenting(true),
        .setKeyboardPresenting(false),
      ])
    case .tapView:
      return .from([
        .setKeyboardDismissing(true),
        .setKeyboardDismissing(false),
      ])
    case let .inputNickname(nickname):
      return .from([
        .setNickname(nickname),
        .setConfirmButtonEnabled(!currentState.nickname.isEmpty),
      ])
    case .tapConfirmButton:
      return .from([
        .saveNickname,
        .setSettingFinished,
        .presentMainView(true),
        .presentMainView(false),
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .setKeyboardPresenting(bool):
      state.keyboardWillPresent = bool
    case let .setKeyboardDismissing(bool):
      state.keyboardWillDismiss = bool
    case let .setNickname(nickname):
      state.nickname = nickname
    case .saveNickname:
      Configuration.shared.nickname = currentState.nickname
    case .setSettingFinished:
      Configuration.shared.isSettingFinished = true
    case let .presentMainView(bool):
      state.viewWillPresentMainView = bool
    case let .setConfirmButtonEnabled(bool):
      state.isConfirmButtonEnabled = bool
    }
    return state
  }
}
