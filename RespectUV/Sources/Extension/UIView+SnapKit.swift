//
//  UIView+SnapKit.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import SnapKit

extension UIView {
  func makeConstraints(_ constraintMaker: (ConstraintMaker) -> Void) {
    snp.makeConstraints(constraintMaker)
  }
}
