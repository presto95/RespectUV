//
//  BPMStandardDefaultsSettingViewReactor.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import ReactorKit
import RxSwift

final class BPMStandardDefaultsSettingViewReactor: Reactor {
  enum Action {
    case viewWillAppear
    case changeStandardBPM(Int)
    case tapConfirmButton
  }

  enum Mutation {
    case setStandardBPM(Int)
    case saveStandardBPM
    case popView(Bool)
  }

  struct State {
    var standardBPM = Configuration.shared.bpmStandard
    var viewWillPop = false
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .viewWillAppear:
      return .just(.setStandardBPM(Configuration.shared.bpmStandard))
    case let .changeStandardBPM(value):
      return .just(.setStandardBPM(value))
    case .tapConfirmButton:
      return .from([
        .saveStandardBPM,
        .popView(true),
        .popView(false),
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .setStandardBPM(value):
      state.standardBPM = value
    case .saveStandardBPM:
      Configuration.shared.bpmStandard = currentState.standardBPM
    case let .popView(bool):
      state.viewWillPop = bool
    }
    return state
  }
}
