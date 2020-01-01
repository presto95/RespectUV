//
//  MainTunesChangeViewReactor.swift
//  RespectUV
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

import ReactorKit
import RxSwift

final class MainTunesChangeViewReactor: Reactor {
  enum Action {
    case viewWillAppear
    case changeRow(Int)
  }

  enum Mutation {
    case changeRow(Int)
    case saveMainTunes
  }

  struct State {
    var titles = Tunes.allCases.map { $0.description }
    var selectedRow = 0
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .viewWillAppear:
      return .just(.changeRow(Configuration.shared.mainTunes.order))
    case let .changeRow(row):
      return .from([
        .changeRow(row),
        .saveMainTunes,
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .changeRow(row):
      state.selectedRow = row
    case .saveMainTunes:
      Configuration.shared.mainTunes = .init(order: currentState.selectedRow)
    }
    return state
  }
}
