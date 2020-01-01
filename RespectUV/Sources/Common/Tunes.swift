//
//  Tunes.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

enum Tunes: CaseIterable, CustomStringConvertible {
  case _4b
  case _5b
  case _6b
  case _8b

  init!(string: String) {
    switch string {
    case "4B", "4b":
      self = ._4b
    case "5B", "5b":
      self = ._5b
    case "6B", "6b":
      self = ._6b
    case "8B", "8b":
      self = ._8b
    default:
      return nil
    }
  }

  init!(order: Int) {
    switch order {
    case 0:
      self = ._4b
    case 1:
      self = ._5b
    case 2:
      self = ._6b
    case 3:
      self = ._8b
    default:
      return nil
    }
  }

  var order: Int {
    switch self {
    case ._4b:
      return 0
    case ._5b:
      return 1
    case ._6b:
      return 2
    case ._8b:
      return 4
    }
  }

  var description: String {
    switch self {
    case ._4b:
      return "4B"
    case ._5b:
      return "5B"
    case ._6b:
      return "6B"
    case ._8b:
      return "8B"
    }
  }
}
