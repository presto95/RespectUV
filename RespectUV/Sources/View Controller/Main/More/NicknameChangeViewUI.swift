//
//  NicknameChangeViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/30.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class NicknameChangeViewUI: UI {
  unowned var owner: NicknameChangeViewController

  var viewTapGestureRecognizer: UITapGestureRecognizer!
  var nicknameTextField: UITextField!
  var confirmButton: ConfirmButton!

  init(owner: NicknameChangeViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    owner.title = "닉네임 변경"
    viewTapGestureRecognizer = UITapGestureRecognizer()
    view.addGestureRecognizer(viewTapGestureRecognizer)
    nicknameTextField = UITextField().then {
      $0.borderStyle = .none
      $0.placeholder = Configuration.shared.nickname
      $0.font = .systemFont(ofSize: 35, weight: .bold)
      $0.textColor = Colors.label
    }
    confirmButton = ConfirmButton().then {
      $0.isEnabled = false
    }

    view.addSubviews(nicknameTextField, confirmButton)
  }

  func setupConstraints() {
    nicknameTextField.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
    }
    confirmButton.makeConstraints {
      $0.leading.equalTo(nicknameTextField.snp.leading)
      $0.trailing.equalTo(nicknameTextField.snp.trailing)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
      $0.height.equalTo(44)
    }
  }
}
