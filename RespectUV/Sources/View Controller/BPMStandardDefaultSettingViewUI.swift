//
//  BPMDefaultSettingViewUI.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class BPMStandardDefaultsSettingViewUI: UI {
  unowned var owner: BPMStandardDefaultsSettingViewController

  var titleLabel: UILabel!
  var descriptionLabel: UILabel!
  var slider: UISlider!
  var nextButton: UIButton!

  init(owner: BPMStandardDefaultsSettingViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    titleLabel = UILabel().then {
      $0.text = "BPM 기준 기본값 설정"
      $0.textColor = Colors.label
      $0.font = .systemFont(ofSize: 30, weight: .bold)
    }
    descriptionLabel = UILabel().then {
      $0.text = """
      BPM 기준은 추천 배속 계산에 사용됩니다.
      ex) BPM 기준이 450일 때 BPM 123의 추천 배속 : 450 ÷ 123 = 3.65 -> '3.75'
      """
      $0.textColor = Colors.secondaryLabel
      $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    slider = UISlider().then {
      $0.minimumValue = 1
      $0.maximumValue = 600
    }
    nextButton = UIButton().then {
      $0.layer.do {
        $0.masksToBounds = true
        $0.cornerRadius = 10
      }
    }

    view.addSubviews(titleLabel, descriptionLabel, slider, nextButton)
  }

  func setupConstraints() {
    titleLabel.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
    }
    descriptionLabel.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(16)
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.trailing.equalTo(titleLabel.snp.trailing)
    }
    slider.makeConstraints {
      $0.top.equalTo(descriptionLabel.snp.top).offset(50)
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.trailing.equalTo(titleLabel.snp.trailing)
    }
    nextButton.makeConstraints {
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
      $0.height.equalTo(44)
    }
  }
}
