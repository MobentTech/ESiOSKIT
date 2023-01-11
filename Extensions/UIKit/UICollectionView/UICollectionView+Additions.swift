//
//  UICollectionView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UICollectionView {

  func revalidateFlowLayout(animated: Bool, completion: Callback<Bool>? = .none) {
    guard let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout
      else { return }

    performBatchUpdates({
      collectionViewLayout.invalidateLayout()
      setCollectionViewLayout(collectionViewLayout, animated: animated)
    }, completion: completion)
  }

  // swiftlint:disable identifier_name force_cast
  func dequeueReusableCell<T: UICollectionViewCell>(identifier: String, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
  }
  // swiftlint:enable identifier_name force_cast

  func registerCells(for types: [UICollectionViewCell.Type]) {
    types.forEach {
      register($0.nib, forCellWithReuseIdentifier: String(describing: $0))
    }
  }

  func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
    let identifier = String(describing: T.self)
    return dequeueReusableCell(identifier: identifier, for: indexPath) as! T
  }

  var flowLayout: UICollectionViewFlowLayout? {
    return collectionViewLayout as? UICollectionViewFlowLayout
  }
}
