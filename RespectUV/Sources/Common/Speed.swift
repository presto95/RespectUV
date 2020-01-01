//
//  Speed.swift
//  RespectUV
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

enum Speed: CustomStringConvertible {
  case _0_25
  case _0_50
  case _0_75
  case _1_00
  case _1_25
  case _1_50
  case _1_75
  case _2_00
  case _2_25
  case _2_50
  case _2_75
  case _3_00
  case _3_25
  case _3_50
  case _3_75
  case _4_00
  case _4_25
  case _4_50
  case _4_75
  case _5_00

  init!(bpm: Int) {
    let bias = 0.125
    let standard = Configuration.shared.bpmStandard
    let value = Double(bpm) / Double(standard)
    switch value {
    case 0 ..< 0.25 + bias:
      self = ._0_25
    case 0.25 + bias ..< 0.50 + bias:
      self = ._0_50
    case 0.50 + bias ..< 0.75 + bias:
      self = ._0_75
    case 0.75 + bias ..< 1.00 + bias:
      self = ._1_00
    case 1.00 + bias ..< 1.25 + bias:
      self = ._1_25
    case 1.25 + bias ..< 1.50 + bias:
      self = ._1_50
    case 1.50 + bias ..< 1.75 + bias:
      self = ._1_75
    case 1.75 + bias ..< 2.00 + bias:
      self = ._2_00
    case 2.00 + bias ..< 2.25 + bias:
      self = ._2_25
    case 2.25 + bias ..< 2.50 + bias:
      self = ._2_50
    case 2.50 + bias ..< 2.75 + bias:
      self = ._2_75
    case 2.75 + bias ..< 3.00 + bias:
      self = ._3_00
    case 3.00 + bias ..< 3.25 + bias:
      self = ._3_25
    case 3.25 + bias ..< 3.50 + bias:
      self = ._3_50
    case 3.50 + bias ..< 3.75 + bias:
      self = ._3_75
    case 3.75 + bias ..< 4.00 + bias:
      self = ._4_00
    case 4.00 + bias ..< 4.25 + bias:
      self = ._4_25
    case 4.25 + bias ..< 4.50 + bias:
      self = ._4_50
    case 4.50 + bias ..< 4.75 + bias:
      self = ._4_75
    case 4.75 + bias ... 5.00:
      self = ._5_00
    default:
      return nil
    }
  }

  var description: String {
    switch self {
    case ._0_25:
      return "0.25"
    case ._0_50:
      return "0.50"
    case ._0_75:
      return "0.75"
    case ._1_00:
      return "1.00"
    case ._1_25:
      return "1.25"
    case ._1_50:
      return "1.50"
    case ._1_75:
      return "1.75"
    case ._2_00:
      return "2.00"
    case ._2_25:
      return "2.25"
    case ._2_50:
      return "2.50"
    case ._2_75:
      return "2.75"
    case ._3_00:
      return "3.00"
    case ._3_25:
      return "3.25"
    case ._3_50:
      return "3.50"
    case ._3_75:
      return "3.75"
    case ._4_00:
      return "4.00"
    case ._4_25:
      return "4.25"
    case ._4_50:
      return "4.50"
    case ._4_75:
      return "4.75"
    case ._5_00:
      return "5.00"
    }
  }
}
