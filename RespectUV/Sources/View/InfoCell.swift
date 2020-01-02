//
//  InfoCell.swift
//  RespectUV
//
//  Created by Presto on 2020/01/02.
//  Copyright © 2020 presto. All rights reserved.
//

import UIKit

final class InfoCell: UITableViewCell {
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
