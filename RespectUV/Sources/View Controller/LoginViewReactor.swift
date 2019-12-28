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
      return loginViaKakao()
        .filter { $0 }
        .map { _ in Mutation.loginViaKakao }
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

private extension LoginViewReactor {
  func loginViaKakao() -> Observable<Bool> {
    return .create { observer in
      KakaoLoginService.shared.open { error in
        if let error = error {
          Log.error(error.localizedDescription)
          observer.onNext(false)
        }
        if KakaoLoginService.shared.isOpen {
          Log.debug("login success")
          observer.onNext(true)
        } else {
          Log.error("login failed")
          observer.onNext(false)
        }
      }
      return Disposables.create()
    }
  }
}
