//
//  MoreSectionModel.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

import RxDataSources

struct MoreSectionModel {
  struct Item {
    var text: String?
    var detail: String?
  }

  var header: String?
  var items: [Item]
}

extension MoreSectionModel: SectionModelType {
  init(original: MoreSectionModel, items: [MoreSectionModel.Item]) {
    self = original
    self.items = items
  }
}
