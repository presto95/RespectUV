//
//  Reactive+UIViewController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/28.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
  func present(animated: Bool = true, completion: (() -> Void)? = nil) -> Binder<UIViewController> {
    return .init(base) { target, viewController in
      target.present(viewController, animated: animated, completion: completion)
    }
  }

  func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) -> Binder<Void> {
    return .init(base) { target, _ in
      target.dismiss(animated: animated, completion: completion)
    }
  }
}
