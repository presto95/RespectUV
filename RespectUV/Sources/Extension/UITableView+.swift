//
//  UITableView+.swift
//  MyBookshelf
//
//  Created by Presto on 2019/12/14.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

extension UITableView {
  func register<Cell: UITableViewCell>(_ type: Cell.Type) {
    register(type, forCellReuseIdentifier: type.name)
  }
}
