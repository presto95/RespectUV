//
//  Difficulty.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

enum Difficulty: CustomStringConvertible {
  case normal
  case hard
  case maximum
  case sc

  init!(string: String) {
    switch string {
    case "NORMAL", "normal":
      self = .normal
    case "HARD", "hard":
      self = .hard
    case "MAXIMUM", "maximum":
      self = .maximum
    case "SC", "sc":
      self = .sc
    default:
      return nil
    }
  }

  var description: String {
    switch self {
    case .normal:
      return "NORMAL"
    case .hard:
      return "HARD"
    case .maximum:
      return "MAXIMUM"
    case .sc:
      return "SC"
    }
  }
}
