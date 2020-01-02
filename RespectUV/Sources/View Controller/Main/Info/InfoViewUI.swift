//
//  InfoViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class InfoViewUI: UI {
  unowned var owner: InfoViewController

  var tableView: UITableView!

  init(owner: InfoViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    tableView = UITableView(frame: .zero, style: .grouped).then {
      $0.register(InfoCell.self)
    }

    view.addSubviews(tableView)
  }

  func setupConstraints() {
    tableView.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
