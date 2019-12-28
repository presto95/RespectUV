//
//  MoreViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class MoreViewUI: UI {
  unowned var owner: MoreViewController

  var tableView: UITableView!

  init(owner: MoreViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    tableView = UITableView(frame: .zero, style: .grouped)

    view.addSubviews(tableView)
  }

  func setupConstraints() {
    tableView.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
