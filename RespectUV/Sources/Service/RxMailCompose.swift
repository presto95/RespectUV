//
//  RxMailCompose.swift
//  RespectUV
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

import MessageUI
import UIKit

import RxCocoa
import RxSwift

typealias RxMFMailComposeResult = Result<RxMFMailComposeState, RxMFMailComposeError>

final class RxMFMailComposeViewControllerDelegateProxy: DelegateProxy<MFMailComposeViewController, MFMailComposeViewControllerDelegate>, DelegateProxyType, MFMailComposeViewControllerDelegate {
  static func registerKnownImplementations() {
    register { RxMFMailComposeViewControllerDelegateProxy(parentObject: $0, delegateProxy: self) }
  }

  static func currentDelegate(for object: MFMailComposeViewController) -> MFMailComposeViewControllerDelegate? {
    return object.mailComposeDelegate
  }

  static func setCurrentDelegate(_ delegate: MFMailComposeViewControllerDelegate?, to object: MFMailComposeViewController) {
    object.mailComposeDelegate = delegate
  }
}

extension Reactive where Base: MFMailComposeViewController {
  var mailComposeDelegate: DelegateProxy<MFMailComposeViewController, MFMailComposeViewControllerDelegate> {
    return RxMFMailComposeViewControllerDelegateProxy.proxy(for: base)
  }

  var result: Observable<RxMFMailComposeResult> {
    if !MFMailComposeViewController.canSendMail() {
      return .just(.failure(.cannotSend))
    }
    return mailComposeDelegate
      .methodInvoked(#selector(MFMailComposeViewControllerDelegate.mailComposeController(_:didFinishWith:error:)))
      .map { parameters in
        let result = parameters[1] as! Int
        let error = parameters[2] as? MFMailComposeError
        switch result {
        case 0:
          return .success(.cancelled)
        case 1:
          return .success(.saved)
        case 2:
          return .success(.sent)
        case 3:
          switch error!.code {
          case .saveFailed:
            return .failure(.saveFailed)
          case .sendFailed:
            return .failure(.sendFailed)
          @unknown default:
            fatalError()
          }
        default:
          fatalError()
        }
      }
      .do(onNext: { [weak base] _ in
        base?.dismiss(animated: true, completion: nil)
      })
  }
}

enum RxMFMailComposeState {
  case cancelled
  case saved
  case sent
}

enum RxMFMailComposeError: Error {
  case cannotSend
  case sendFailed
  case saveFailed
}
