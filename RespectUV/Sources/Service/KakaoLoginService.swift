//
//  KakaoLoginService.swift
//  RespectUV
//
//  Created by Presto on 2019/12/28.
//  Copyright © 2019 presto. All rights reserved.
//

import KakaoOpenSDK
import RxSwift

enum LoginError: Error {
  case specific(Error)
  case unknown
}

final class KakaoLoginService {
  static let shared = KakaoLoginService()

  private let session = KOSession.shared()!

  var accessToken: String? {
    return session.token?.accessToken
  }

  var refreshToken: String? {
    return session.token?.refreshToken
  }

  func login() -> Single<Void> {
    return .create { observer in
      self.session.open { error in
        if let error = error {
          Log.error(error.localizedDescription)
          observer(.error(LoginError.specific(error)))
        }
        if self.session.isOpen() {
          Log.debug("kakao login success")
          observer(.success(Void()))
        } else {
          Log.error("kakao login fail")
          observer(.error(LoginError.unknown))
        }
      }
      return Disposables.create {
        self.session.close()
      }
    }
  }

  func logout() -> Single<Bool> {
    return .create { observer in
      self.session.logoutAndClose { flag, error in
        if let error = error {
          observer(.error(LoginError.specific(error)))
        }
        observer(.success(flag))
      }
      return Disposables.create()
    }
  }

  func isKakaoAccountLoginCallback(_ url: URL?) -> Bool {
    return KOSession.isKakaoAccountLoginCallback(url)
  }

  func handleOpenURL(_ url: URL?) -> Bool {
    return KOSession.handleOpen(url)
  }

  func handleDidBecomeActive() {
    KOSession.handleDidBecomeActive()
  }
}
