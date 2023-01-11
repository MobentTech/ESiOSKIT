//
//  UIScrollView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIScrollView {

  struct Direction: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
      self.rawValue = rawValue
    }

    public static let horizontal = Direction(rawValue: 1 << 0)
    public static let vertical = Direction(rawValue: 1 << 1)
  }

  @discardableResult
  func changeContentOffset(_ contentOffset: CGPoint, animated: Bool) -> Bool {
    if self.contentOffset.equalTo(contentOffset) {
      return false
    }
    setContentOffset(contentOffset, animated: animated)
    return true
  }

  @objc func scrollToTop(animated: Bool) {
    let newContentOffset = CGPoint(x: contentOffset.x, y: -contentInset.top)
    setContentOffset(newContentOffset, animated: animated)
  }

  @objc func scrollToBottom(animated: Bool) {
    if ceil(contentSize.height) < bounds.height { return }
    setContentOffset(maxOffset, animated: animated)
  }

  var maxOffset: CGPoint {
    return CGPoint(
      x: max(0, contentSize.ceiled.width - (bounds.width + contentInset.right)),
      y: max(0, contentSize.ceiled.height - (bounds.height + contentInset.bottom))
    )
  }

  var direction: Direction {
    var direction: Direction = []

    if bounds.height < contentSize.height { direction.formUnion(.vertical) }
    if bounds.width < contentSize.width { direction.formUnion(.horizontal) }

    return direction
  }

  func adjustScrollBehaviorFittingContent() {
    isScrollEnabled = floor(contentSize.height) > bounds.size.height
  }

  var isReachedBottom: Bool {
    return contentOffset.y >= floor(contentSize.height) - bounds.height
  }

  func calculatePage(from collectionView: UICollectionView) -> Int {
    return Int(round(contentOffset.x / collectionView.frame.width))
  }
}
