//
//  UICollectionViewFlowLayout+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UICollectionViewFlowLayout {

  func indexPathAtCenterWithCurrentOffset() -> IndexPath? {
    guard let collectionView = collectionView else { return .none }

    let centerOffset: CGPoint

    switch scrollDirection {
    case .horizontal:
      centerOffset = CGPoint(x: collectionView.frame.width / 2.0, y: 0)

    case .vertical:
      centerOffset = CGPoint(x: 0, y: collectionView.frame.height / 2.0)

    @unknown default:
      fatalError("Unknown scrollDirection")
    }

    return collectionView.indexPathForItem(at: collectionView.contentOffset + centerOffset)
  }
}
