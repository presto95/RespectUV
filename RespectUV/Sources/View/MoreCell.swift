//
//  MoreCell.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class MoreCell: UITableViewCell {
  override var reuseIdentifier: String? {
    return name
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .value1, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
