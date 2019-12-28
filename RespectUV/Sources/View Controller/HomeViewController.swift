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

  override func loadView() {
    ui = .init(owner: self)
  }

  func bind(reactor: Reactor) {}
}
