//
//  Reactive+UITextField.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

import RxCocoa
import RxSwift

extension Reactive where Base: UITextField {
  var becomeFirstResponder: Binder<Void> {
    return .init(base) { target, _ in
      target.becomeFirstResponder()
    }
  }

  var resignFirstResponder: Binder<Void> {
    return .init(base) { target, _ in
      target.resignFirstResponder()
    }
  }
}
