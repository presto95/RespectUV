//
//  Series.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

enum Series: CustomStringConvertible {
  case respect
  case portable1
  case portable2

  init!(string: String) {
    switch string {
    case "RESPECT", "respect":
      self = .respect
    case "PORTABLE1", "portable1":
      self = .portable1
    case "PORTABLE2", "portable2":
      self = .portable2
    default:
      return nil
    }
  }

  var description: String {
    switch self {
    case .respect:
      return "RESPECT"
    case .portable1:
      return "PORTABLE 1"
    case .portable2:
      return "PORTABLE 2"
    }
  }
}
