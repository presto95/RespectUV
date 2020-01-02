//
//  InfoViewReactor.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import ReactorKit
import RxSwift

final class InfoViewReactor: Reactor {
  enum Action {
    case viewWillAppear
    case tapCell(IndexPath)
  }

  enum Mutation {
    case reloadSectionData
    case selectCell(IndexPath?)
  }

  struct State {
    var sectionModel = [InfoSectionModel]()
    var selectedIndexPath: IndexPath?
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .viewWillAppear:
      return .just(.reloadSectionData)
    case let .tapCell(indexPath):
      return .from([
        .selectCell(indexPath),
        .selectCell(nil)
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .reloadSectionData:
      state.sectionModel = makeSectionModel()
    case let .selectCell(indexPath):
      state.selectedIndexPath = indexPath
    }
    return state
  }
}

private extension InfoViewReactor {
  func makeSectionModel() -> [InfoSectionModel] {
    return [
      .init(model: "", items: ["음악", "미션", "컬렉션", "팁"])
    ]
  }
}
