//
//  IndexPath+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension IndexPath {

  static let zero = IndexPath(item: 0, section: 0)
  static let invalid = IndexPath(item: .invalid, section: .invalid)

  func isLastRow(at tableView: UITableView) -> Bool {
    return row == (tableView.numberOfRows(inSection: section) - 1)
  }

  func isLastRow(at collectionView: UICollectionView) -> Bool {
    return row == (collectionView.numberOfItems(inSection: section) - 1)
  }

  var isFirstRow: Bool {
    return row.isZero
  }

  var isFirstSection: Bool {
    return section.isZero
  }
}
