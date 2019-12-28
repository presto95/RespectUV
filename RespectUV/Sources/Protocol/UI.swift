//
//  UI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

protocol UI {
  associatedtype Owner: UIOwner

  var owner: Owner { get }
  var view: UIView { get }

  init(owner: Owner)

  func setupSubviews()
  func setupConstraints()
}

extension UI where Owner: UIViewController {
  var view: UIView {
    return owner.view
  }
}

extension UI where Owner: UIView {
  var view: UIView {
    return owner
  }
}
