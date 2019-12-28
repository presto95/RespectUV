//
//  UserDefault.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

import Foundation

final class Configuration {
  private enum Key {
    static let bpmStandard = "bpmStandard"
    static let hasLogin = "hasLogin"
  }

  private let defaults = UserDefaults.standard

  var bpmStandard: Int {
    get {
      return defaults.integer(forKey: Key.bpmStandard)
    }
    set {
      defaults.set(newValue, forKey: Key.bpmStandard)
    }
  }

  var hasLogin: Bool {
    get {
      return defaults.bool(forKey: Key.hasLogin)
    }
    set {
      defaults.set(newValue, forKey: Key.hasLogin)
    }
  }
}
