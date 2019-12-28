//
//  LoginViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import KakaoOpenSDK
import NaverThirdPartyLogin

final class LoginViewUI: UI {
  unowned var owner: LoginViewController

  var loginViaGoogleButton: UIButton!
  var loginViaNaverButton: UIButton!
  var loginViaKakaoButton: KOLoginButton!
  var loginViaAppleButton: UIButton!

  init(owner: LoginViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    loginViaGoogleButton = UIButton().then {
      $0.setTitle("google", for: [])
    }
    loginViaNaverButton = UIButton().then {
      $0.setTitle("naver", for: [])
    }
    loginViaKakaoButton = KOLoginButton()
    loginViaAppleButton = UIButton().then {
      $0.setTitle("apple", for: [])
    }
    view.addSubviews(loginViaGoogleButton, loginViaAppleButton, loginViaNaverButton, loginViaKakaoButton)
  }

  func setupConstraints() {
    loginViaGoogleButton.makeConstraints {
      $0.leading.equalTo(loginViaAppleButton.snp.leading)
      $0.trailing.equalTo(loginViaAppleButton.snp.trailing)
      $0.bottom.equalTo(loginViaNaverButton.snp.top).offset(-16)
    }
    loginViaNaverButton.makeConstraints {
      $0.leading.equalTo(loginViaAppleButton.snp.leading)
      $0.trailing.equalTo(loginViaAppleButton.snp.trailing)
      $0.bottom.equalTo(loginViaKakaoButton.snp.top).offset(-16)
    }
    loginViaKakaoButton.makeConstraints {
      $0.leading.equalTo(loginViaAppleButton.snp.leading)
      $0.trailing.equalTo(loginViaAppleButton.snp.trailing)
      $0.bottom.equalTo(loginViaAppleButton.snp.top).offset(-16)
      $0.height.equalTo(44)
    }
    loginViaAppleButton.makeConstraints {
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
    }
  }
}
