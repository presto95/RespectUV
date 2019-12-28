//
//  UIAlertController+.swift
//  MyBookshelf
//
//  Created by Presto on 2019/12/14.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

extension UIAlertController {
  static func alert(title: String?,
                    message: String?,
                    style: UIAlertController.Style = .alert) -> UIAlertController {
    return .init(title: title, message: message, preferredStyle: style)
  }

  func action(title: String?,
              style: UIAlertAction.Style = .default,
              completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
    addAction(.init(title: title, style: style, handler: completion))
    return self
  }

  func textField(configurationHandler: ((UITextField) -> Void)? = nil) -> UIAlertController {
    addTextField(configurationHandler: configurationHandler)
    return self
  }
}
