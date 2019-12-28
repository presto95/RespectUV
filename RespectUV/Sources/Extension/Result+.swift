//
//  Result+.swift
//  MyBookshelf
//
//  Created by Presto on 2019/12/14.
//  Copyright © 2019 presto. All rights reserved.
//

extension Result {
  var success: Success? {
    guard case let .success(success) = self else { return nil }
    return success
  }

  var failure: Failure? {
    guard case let .failure(error) = self else { return nil }
    return error
  }
}
