//
//  CollectionViewController.swift
//  RespectUV
//
//  Created by Presto on 2020/01/02.
//  Copyright © 2020 presto. All rights reserved.
//

import UIKit

import ReactorKit

final class CollectionViewController: BaseViewController, View, UIOwner {
  typealias Reactor = CollectionViewReactor

  var ui: CollectionViewUI!

  init(reactor: Reactor) {
    super.init()
    ui = .init(owner: self)
    self.reactor = reactor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(reactor: Reactor) {
    
  }
}
