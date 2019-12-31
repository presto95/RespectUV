//
//  UIStackView+.swift
//  RespectUV
//
//  Created by Presto on 2019/12/29.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

extension UIStackView {
  func addArrangedSubviews(_ subviews: UIView...) {
    subviews.forEach { addArrangedSubview($0) }
  }
}
