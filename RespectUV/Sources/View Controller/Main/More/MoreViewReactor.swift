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
    case viewWillAppear
    case tapCell(IndexPath)
    case sendMail(RxMFMailComposeResult)
  }

  enum Mutation {
    case reloadSectionData
    case selectCell(IndexPath?)
    case sendMail(RxMFMailComposeResult?)
  }

  struct State {
    var sectionModel = [MoreSectionModel]()
    var selectedIndexPath: IndexPath?
    var mailResult: RxMFMailComposeResult?
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .viewWillAppear:
      return .just(.reloadSectionData)
    case let .tapCell(indexPath):
      return .from([
        .selectCell(indexPath),
        .selectCell(nil),
      ])
    case let .sendMail(result):
      return .from([
        .sendMail(result),
        .sendMail(nil),
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
    case let .sendMail(result):
      state.mailResult = result
    }
    return state
  }
}

private extension MoreViewReactor {
  func makeSectionModel() -> [MoreSectionModel] {
    return [
      .init(header: "개인 설정",
            items: [
              .init(text: "BPM 기준값 변경", detail: "BPM \(Configuration.shared.bpmStandard)"),
              .init(text: "주 버튼 변경", detail: "\(Configuration.shared.mainTunes.description)"),
              .init(text: "닉네임 변경", detail: Configuration.shared.nickname),
            ]),
      .init(header: "의견",
            items: [
              .init(text: "피드백", detail: nil),
              .init(text: "평가", detail: nil),
            ]),
      .init(header: nil,
            items: [
              .init(text: "오픈 소스 라이센스", detail: nil),
            ]),
    ]
  }
}
