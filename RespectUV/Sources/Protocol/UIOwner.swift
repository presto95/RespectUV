//
//  UIOwner.swift
//  RespectUV
//
//  Created by Presto on 2019/12/27.
//  Copyright © 2019 presto. All rights reserved.
//

protocol UIOwner {
  associatedtype UIType: UI

  var ui: UIType! { get }
}
