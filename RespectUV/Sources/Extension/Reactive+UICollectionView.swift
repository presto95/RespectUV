//
//  Reactive+UICollectionView.swift
//  MyBookshelf
//
//  Created by Presto on 2019/12/14.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UICollectionView {
  func items<Sequence: Swift.Sequence, Cell: UICollectionViewCell, Source: ObservableType>(_ type: Cell.Type)
    -> (_ source: Source)
    -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
    -> Disposable where Source.Element == Sequence {
    return items(cellIdentifier: type.name, cellType: type)
  }
}
