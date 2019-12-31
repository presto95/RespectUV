//
//  InfoViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class InfoViewUI: UI {
  unowned var owner: InfoViewController

  init(owner: InfoViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {}

  func setupConstraints() {}
}
