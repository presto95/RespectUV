//
//  NicknameSettingViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class NicknameSettingViewUI: UI {
  unowned var owner: NicknameSettingViewController

  var titleLabel: UILabel!
  var nicknameTextField: UITextField!
  var nextButton: UIButton!

  init(owner: NicknameSettingViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    titleLabel = UILabel().then {
      $0.text = "닉네임 설정"
      $0.font = .systemFont(ofSize: 30, weight: .bold)
      $0.textColor = Colors.label
    }
    nicknameTextField = UITextField().then {
      $0.borderStyle = .none
      $0.placeholder = "닉네임"
      $0.font = .systemFont(ofSize: 40, weight: .bold)
      $0.textColor = Colors.label
    }
    nextButton = UIButton().then {
      $0.layer.do {
        $0.masksToBounds = true
        $0.cornerRadius = 10
      }
      $0.setTitle("다음", for: .normal)
      $0.isEnabled = false
    }

    view.addSubviews(titleLabel, nicknameTextField, nextButton)
  }

  func setupConstraints() {
    nextButton.makeConstraints {
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
      $0.height.equalTo(44)
    }
  }
}
