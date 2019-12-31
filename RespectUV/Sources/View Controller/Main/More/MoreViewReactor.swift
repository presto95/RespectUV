//
//  MoreViewReactor.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import ReactorKit
import RxSwift

final class MoreViewReactor: Reactor {
  enum Action {
    case tapCell(IndexPath)
  }

  enum Mutation {
    case selectCell(IndexPath)
  }

  struct State {
    var sectionModel = [
      MoreSectionModel(model: "개인 설정", items: ["BPM 기준값 변경", "닉네임 변경"]),
      MoreSectionModel(model: "", items: ["오픈 소스 라이센스"]),
    ]
    var selectedIndexPath: IndexPath?
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .tapCell(indexPath):
      return .just(.selectCell(indexPath))
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .selectCell(indexPath):
      state.selectedIndexPath = indexPath
    }
    return state
  }
}
