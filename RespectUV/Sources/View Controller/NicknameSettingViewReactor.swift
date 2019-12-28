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
    case inputNickname(String)
    case tapNextButton
  }

  enum Mutation {
    case setNickname(String)
    case pushBPMStandardView(Bool)
  }

  struct State {
    var nickname = ""
    var isNextButtonSelected = false
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .inputNickname(nickname):
      return .just(.setNickname(nickname))
    case .tapNextButton:
      return Observable.concat([
        .just(.pushBPMStandardView(true)),
        .just(.pushBPMStandardView(false)),
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .setNickname(nickname):
      state.nickname = nickname
    case let .pushBPMStandardView(bool):
      state.isNextButtonSelected = bool
    }
    return state
  }
}
