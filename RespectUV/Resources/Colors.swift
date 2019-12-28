//
//  Colors.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

enum Colors {
  static var background: UIColor {
    if #available(iOS 13.0, *) {
      return .systemBackground
    } else {
      return .white
    }
  }

  static var label: UIColor {
    if #available(iOS 13.0, *) {
      return .label
    } else {
      return .black
    }
  }

  static var secondaryLabel: UIColor {
    if #available(iOS 13.0, *) {
      return .secondaryLabel
    } else {
      return .lightGray
    }
  }
}
