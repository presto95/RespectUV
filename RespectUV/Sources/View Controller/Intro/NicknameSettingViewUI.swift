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

  var viewTapGestureRecognizer: UITapGestureRecognizer!
  var titleLabel: UILabel!
  var nicknameTextField: UITextField!
  var confirmButton: ConfirmButton!

  init(owner: NicknameSettingViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    viewTapGestureRecognizer = UITapGestureRecognizer()
    view.addGestureRecognizer(viewTapGestureRecognizer)
    titleLabel = UILabel().then {
      $0.text = "닉네임 설정"
      $0.font = .systemFont(ofSize: 30, weight: .bold)
      $0.textColor = Colors.label
    }
    nicknameTextField = UITextField().then {
      $0.borderStyle = .none
      $0.placeholder = "닉네임"
      $0.font = .systemFont(ofSize: 35, weight: .bold)
      $0.textColor = Colors.label
    }
    confirmButton = ConfirmButton().then {
      $0.isEnabled = false
    }

    view.addSubviews(titleLabel, nicknameTextField, confirmButton)
  }

  func setupConstraints() {
    titleLabel.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
    }
    nicknameTextField.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(40)
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.trailing.equalTo(titleLabel.snp.trailing)
    }
    confirmButton.makeConstraints {
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
      $0.height.equalTo(44)
    }
  }
}
