//
//  InfoViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit

final class InfoViewController: BaseViewController, View, UIOwner {
  typealias Reactor = InfoViewReactor

  var ui: InfoViewUI!

  override func loadView() {
    ui = .init(owner: self)
  }

  func bind(reactor: Reactor) {}
}
