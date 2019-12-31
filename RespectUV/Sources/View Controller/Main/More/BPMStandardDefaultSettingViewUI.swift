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

  var descriptionLabel: UILabel!
  var valueLabel: UILabel!
  var valueSlider: UISlider!
  var confirmButton: ConfirmButton!

  init(owner: BPMStandardDefaultsSettingViewController) {
    self.owner = owner
    owner.view = RootView()
    setupSubviews()
    setupConstraints()
  }

  func setupSubviews() {
    owner.title = "BPM 기준 변경"
    descriptionLabel = UILabel().then {
      $0.text = """
      BPM 기준은 추천 배속 계산에 사용됩니다.

      예)
      BPM 기준이 450일 때 BPM 123의 추천 배속
      -> 450 ÷ 123 = 3.65 -> '3.75'
      """
      $0.textColor = Colors.secondaryLabel
      $0.numberOfLines = 0
      $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    valueLabel = UILabel().then {
      $0.font = .systemFont(ofSize: 40, weight: .bold)
    }
    valueSlider = UISlider().then {
      $0.minimumValue = 25
      $0.maximumValue = 1000
    }
    confirmButton = .init()

    view.addSubviews(descriptionLabel, valueLabel, valueSlider, confirmButton)
  }

  func setupConstraints() {
    descriptionLabel.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
    }
    valueLabel.makeConstraints {
      $0.top.equalTo(descriptionLabel.snp.bottom).offset(50)
      $0.centerX.equalToSuperview()
    }
    valueSlider.makeConstraints {
      $0.top.equalTo(valueLabel.snp.bottom).offset(16)
      $0.leading.equalTo(descriptionLabel.snp.leading)
      $0.trailing.equalTo(descriptionLabel.snp.trailing)
    }
    confirmButton.makeConstraints {
      $0.leading.equalTo(descriptionLabel.snp.leading)
      $0.trailing.equalTo(descriptionLabel.snp.trailing)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
      $0.height.equalTo(44)
    }
  }
}
