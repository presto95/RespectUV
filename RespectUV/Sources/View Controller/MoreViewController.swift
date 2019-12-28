//
//  MoreViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import ReactorKit

final class MoreViewController: BaseViewController, View, UIOwner {
  typealias Reactor = MoreViewReactor
  var ui: MoreViewUI!

  override func loadView() {
    ui = .init(owner: self)
  }

  func bind(reactor: Reactor) {}
}
