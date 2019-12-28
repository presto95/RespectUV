//
//  KakaoLoginService.swift
//  RespectUV
//
//  Created by Presto on 2019/12/28.
//  Copyright © 2019 presto. All rights reserved.
//

import KakaoOpenSDK

final class KakaoLoginService {
  static let shared = KakaoLoginService()

  private let session = KOSession.shared()!

  func close() {
    session.close()
  }

  var isOpen: Bool {
    return session.isOpen()
  }

  var accessToken: String? {
    return session.token?.accessToken
  }

  var refreshToken: String? {
    return session.token?.refreshToken
  }

  func open(withCompletionHandler handler: @escaping (Error?) -> Void) {
    session.open(completionHandler: handler)
  }

  func logout(withCompletionHandler handler: @escaping (Bool, Error?) -> Void) {
    session.logoutAndClose(completionHandler: handler)
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
