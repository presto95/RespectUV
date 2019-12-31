//
//  AppDelegate.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import Firebase
import Then

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = .init()
    let configuration = Configuration.shared
    if !configuration.isSettingFinished {
      configuration.bpmStandard = 450
      let rootViewController = LoginViewController(reactor: LoginViewReactor())
      window?.rootViewController = LoginNavigationController(rootViewController: rootViewController)
    } else {
      window?.rootViewController = MainTabBarController()
    }
    window?.makeKeyAndVisible()

    FirebaseApp.configure()
    return true
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    KakaoLoginService.shared.handleDidBecomeActive()
  }
}

extension AppDelegate {
  func application(_ app: UIApplication,
                   open url: URL,
                   options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    if KakaoLoginService.shared.isKakaoAccountLoginCallback(url) {
      return KakaoLoginService.shared.handleOpenURL(url)
    }
    return false
  }
}
