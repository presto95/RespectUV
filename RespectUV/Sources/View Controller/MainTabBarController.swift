//
//  MainTabBarController.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let homeTabBarItem = UITabBarItem().then {
      $0.title = "홈"
    }
    let infoTabBarItem = UITabBarItem().then {
      $0.title = "정보"
    }
    let moreTabBarItem = UITabBarItem().then {
      $0.title = "더보기"
    }
    let homeViewController = HomeViewController().then {
      $0.tabBarItem = homeTabBarItem
    }
    let infoViewController = InfoViewController().then {
      $0.tabBarItem = infoTabBarItem
    }
    let moreViewController = MoreViewController().then {
      $0.tabBarItem = moreTabBarItem
    }
    viewControllers = [homeViewController, infoViewController, moreViewController]
  }
}
