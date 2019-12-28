//
//  RootView.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

class RootView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Colors.background
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
