//
//  ConfirmButton.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class ConfirmButton: UIButton {
  override var buttonType: UIButton.ButtonType {
    return .system
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    layer.do {
      $0.masksToBounds = true
      $0.cornerRadius = 10
    }
    backgroundColor = Colors.label
    titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
    setTitle("완료", for: .normal)
    setTitleColor(Colors.background, for: .normal)
    setTitleColor(Colors.secondaryLabel, for: .disabled)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
