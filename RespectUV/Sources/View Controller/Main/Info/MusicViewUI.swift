//
//  MusicViewUI.swift
//  RespectUV
//
//  Created by Presto on 2020/01/02.
//  Copyright © 2020 presto. All rights reserved.
//

import UIKit

final class MusicViewUI: UI {
  unowned var owner: MusicViewController

  init(owner: MusicViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {

  }

  func setupConstraints() {
    
  }
}
