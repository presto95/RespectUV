//
//  LoginViewReactor.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import KakaoOpenSDK
import NaverThirdPartyLogin
import ReactorKit
import RxSwift

final class LoginViewReactor: Reactor {
  enum Action {
    case loginViaGoogle
    case loginViaNaver
    case loginViaKakao
    case loginViaApple
  }

  enum Mutation {
    case loginViaGoogle
    case loginViaNaver
    case loginViaKakao
    case loginViaApple
  }

  struct State {
    var hasLogin = false
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .loginViaGoogle:
      break
    case .loginViaNaver:
      break
    case .loginViaKakao:
      return KakaoLoginService.shared.login()
        .map { Mutation.loginViaKakao }
        .asObservable()
    case .loginViaApple:
      break
    }
    return .empty()
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .loginViaGoogle:
      break
    case .loginViaNaver:
      break
    case .loginViaKakao:
      state.hasLogin = true
    case .loginViaApple:
      break
    }
    return state
  }
}
