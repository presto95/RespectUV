//
//  FinishViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/28.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class FinishViewUI: UI {
  unowned var owner: FinishViewController

  init(owner: FinishViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {}

  func setupConstraints() {}
}
