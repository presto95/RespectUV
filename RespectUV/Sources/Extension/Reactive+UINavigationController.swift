//
//  Reactive+UINavigationController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/28.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UINavigationController {
  func push(animated: Bool = true) -> Binder<UIViewController> {
    return .init(base) { target, viewController in
      target.pushViewController(viewController, animated: animated)
    }
  }

  func pop(animated: Bool = true) -> Binder<Void> {
    return .init(base) { target, _ in
      target.popViewController(animated: animated)
    }
  }
}
