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
    static let mainTunes = "mainTunes"
    static let nickname = "nickname"
    static let isSettingFinished = "isSettingFinished"
  }

  static let shared = Configuration()
  private init() {}

  private let defaults = UserDefaults.standard

  var bpmStandard: Int {
    get {
      return defaults.integer(forKey: Key.bpmStandard)
    }
    set {
      defaults.set(newValue, forKey: Key.bpmStandard)
    }
  }

  var mainTunes: Tunes {
    get {
      let tunes = defaults.string(forKey: Key.mainTunes) ?? "4B"
      return Tunes(string: tunes)
    }
    set {
      defaults.set(newValue.description, forKey: Key.mainTunes)
    }
  }

  var isSettingFinished: Bool {
    get {
      return defaults.bool(forKey: Key.isSettingFinished)
    }
    set {
      defaults.set(newValue, forKey: Key.isSettingFinished)
    }
  }

  var nickname: String {
    get {
      return defaults.string(forKey: Key.nickname)!
    }
    set {
      defaults.set(newValue, forKey: Key.nickname)
    }
  }
}
