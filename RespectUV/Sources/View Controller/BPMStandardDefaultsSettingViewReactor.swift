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
    case changeStandardBPM(Int)
    case tapNextButton
  }

  enum Mutation {
    case setStandardBPM(Int)
    case saveStandardBPM
    case pushConfirmView(Bool)
  }

  struct State {
    var standardBPM: Int
    var isNextButtonSelected = false
  }

  let initialState: State

  private let configuration = Configuration()

  init() {
    initialState = .init(standardBPM: configuration.bpmStandard)
  }

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .changeStandardBPM(value):
      return .just(.setStandardBPM(value))
    case .tapNextButton:
      return Observable.concat([
        Observable.just(Mutation.saveStandardBPM),
        Observable.just(Mutation.pushConfirmView(true)),
        Observable.just(Mutation.pushConfirmView(false)),
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .setStandardBPM(value):
      state.standardBPM = value
    case .saveStandardBPM:
      configuration.bpmStandard = currentState.standardBPM
    case let .pushConfirmView(bool):
      state.isNextButtonSelected = bool
    }
    return state
  }
}
