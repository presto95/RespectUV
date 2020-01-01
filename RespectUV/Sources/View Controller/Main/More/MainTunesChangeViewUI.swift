//
//  MainTunesChangeViewUI.swift
//  RespectUV
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

import UIKit

final class MainTunesChangeViewUI: UI {
  unowned var owner: MainTunesChangeViewController

  var tunesPickerView: UIPickerView!

  init(owner: MainTunesChangeViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    owner.title = "주 버튼 변경"
    tunesPickerView = UIPickerView()

    view.addSubviews(tunesPickerView)
  }

  func setupConstraints() {
    tunesPickerView.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
