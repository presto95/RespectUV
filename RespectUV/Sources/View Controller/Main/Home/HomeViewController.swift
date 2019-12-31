//
//  HomeViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit

final class HomeViewController: BaseViewController, View, UIOwner {
  typealias Reactor = HomeViewReactor

  var ui: HomeViewUI!

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
    self.reactor = reactor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(reactor: Reactor) {}
}
