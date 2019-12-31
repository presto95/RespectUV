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

  var logoImageView: UIImageView!
  var loginViaGoogleButton: UIButton!
  var loginViaNaverButton: UIButton!
  var loginViaKakaoButton: KOLoginButton!
  var loginViaAppleButton: UIButton!
  var loginButtonStackView: UIStackView!

  init(owner: LoginViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    logoImageView = UIImageView().then {
      $0.image = UIImage(imageLiteralResourceName: "logo")
      $0.contentMode = .scaleAspectFit
    }
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
    loginButtonStackView = UIStackView().then {
      $0.addArrangedSubviews(loginViaGoogleButton, loginViaNaverButton, loginViaKakaoButton, loginViaAppleButton)
      $0.axis = .vertical
      $0.spacing = 8
      $0.distribution = .equalSpacing
      $0.alpha = 0
    }

    view.addSubviews(logoImageView, loginButtonStackView)
  }

  func setupConstraints() {
    logoImageView.makeConstraints {
      $0.width.equalToSuperview().multipliedBy(0.4)
      $0.height.equalTo(logoImageView.snp.width)
      $0.center.equalToSuperview()
    }
    loginViaGoogleButton.makeConstraints {
      $0.height.equalTo(44)
    }
    loginViaNaverButton.makeConstraints {
      $0.height.equalTo(44)
    }
    loginViaKakaoButton.makeConstraints {
      $0.height.equalTo(44)
    }
    loginViaAppleButton.makeConstraints {
      $0.height.equalTo(44)
    }
    loginButtonStackView.makeConstraints {
      $0.width.equalToSuperview().multipliedBy(0.8)
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
    }
  }
}

extension LoginViewUI {
  func animate() {
    animateLogoImageView()
  }

  private func animateLogoImageView() {
    logoImageView.snp.updateConstraints {
      $0.centerY.equalToSuperview().offset(-200)
    }
    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
      self.view.layoutIfNeeded()
    }, completion: { _ in
      self.animateLoginButtons()
    })
  }

  private func animateLoginButtons() {
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
      self.loginButtonStackView.alpha = 1
    }, completion: nil)
  }
}
