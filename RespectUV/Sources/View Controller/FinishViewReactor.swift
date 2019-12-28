//
//  FinishViewReactor.swift
//  RespectUV
//
//  Created by Presto on 2019/12/28.
//  Copyright © 2019 presto. All rights reserved.
//

import ReactorKit
import RxSwift

final class FinishViewReactor: Reactor {
  enum Action {}

  enum Mutation {}

  struct State {}

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {}

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    return state
  }
}
