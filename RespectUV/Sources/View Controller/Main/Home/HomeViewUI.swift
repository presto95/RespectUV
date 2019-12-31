//
//  HomeViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class HomeViewUI: UI {
  unowned var owner: HomeViewController

  init(owner: HomeViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {}

  func setupConstraints() {}
}
