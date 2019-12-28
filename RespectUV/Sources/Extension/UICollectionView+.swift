//
//  UICollectionView+.swift
//  MyBookshelf
//
//  Created by Presto on 2019/12/14.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

extension UICollectionView {
  func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
    register(type, forCellWithReuseIdentifier: type.name)
  }
}
