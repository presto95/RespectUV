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
      $0.image = UIImage(imageLiteralResourceName: "home")
    }
    let infoTabBarItem = UITabBarItem().then {
      $0.title = "정보"
      $0.image = UIImage(imageLiteralResourceName: "info")
    }
    let moreTabBarItem = UITabBarItem().then {
      $0.title = "더보기"
      $0.image = UIImage(imageLiteralResourceName: "more")
    }
    let homeViewController = HomeViewController(reactor: HomeViewReactor()).then {
      $0.title = "홈"
      $0.tabBarItem = homeTabBarItem
    }
    let infoViewController = InfoViewController(reactor: InfoViewReactor()).then {
      $0.title = "정보"
      $0.tabBarItem = infoTabBarItem
    }
    let moreViewController = MoreViewController(reactor: MoreViewReactor()).then {
      $0.title = "더보기"
      $0.tabBarItem = moreTabBarItem
    }
    viewControllers = [
      UINavigationController(rootViewController: homeViewController).then {
        $0.navigationBar.prefersLargeTitles = true
      },
      UINavigationController(rootViewController: infoViewController).then {
        $0.navigationBar.prefersLargeTitles = true
      },
      UINavigationController(rootViewController: moreViewController).then {
        $0.navigationBar.prefersLargeTitles = true
      },
    ]
  }
}
