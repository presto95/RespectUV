//
//  BPM.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

struct BPM: CustomStringConvertible {
  let minimum: Int
  let maximum: Int

  var isChanging: Bool {
    return minimum != maximum
  }

  var description: String {
    return isChanging ? "\(minimum) ~ \(maximum)" : "\(maximum)"
  }
}
