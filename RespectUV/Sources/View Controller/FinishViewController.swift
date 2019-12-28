//
//  FinishViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/28.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa

final class FinishViewController: BaseViewController, View, UIOwner {
  typealias Reactor = FinishViewReactor

  var ui: FinishViewUI!

  override func loadView() {
    ui = .init(owner: self)
  }

  func bind(reactor: Reactor) {}
}
