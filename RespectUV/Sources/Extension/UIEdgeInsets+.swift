//
//  UIEdgeInsets+.swift
//  MyBookshelf
//
//  Created by Presto on 2019/12/14.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
  static func all(_ length: CGFloat) -> UIEdgeInsets {
    return .init(top: length, left: length, bottom: length, right: length)
  }

  static func symmetric(horizontal: CGFloat, vertical: CGFloat) -> UIEdgeInsets {
    return .init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
  }

  static func horizontal(_ length: CGFloat) -> UIEdgeInsets {
    return .init(top: 0, left: length, bottom: 0, right: length)
  }

  static func vertical(_ length: CGFloat) -> UIEdgeInsets {
    return .init(top: length, left: 0, bottom: length, right: 0)
  }

  static func top(_ length: CGFloat) -> UIEdgeInsets {
    return .init(top: length, left: 0, bottom: 0, right: 0)
  }

  static func bottom(_ length: CGFloat) -> UIEdgeInsets {
    return .init(top: 0, left: 0, bottom: length, right: 0)
  }

  static func left(_ length: CGFloat) -> UIEdgeInsets {
    return .init(top: 0, left: length, bottom: 0, right: 0)
  }

  static func right(_ length: CGFloat) -> UIEdgeInsets {
    return .init(top: 0, left: 0, bottom: 0, right: length)
  }
}
