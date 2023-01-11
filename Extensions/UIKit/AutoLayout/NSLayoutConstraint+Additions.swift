//
//  NSLayoutConstraint+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

  func multipliered(_ multiplier: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint.deactivate([self])

    let constraint = NSLayoutConstraint(
      item: firstItem as Any,
      attribute: firstAttribute,
      relatedBy: relation,
      toItem: secondItem,
      attribute: secondAttribute,
      multiplier: multiplier,
      constant: constant)

    constraint.priority = priority
    constraint.shouldBeArchived = shouldBeArchived
    constraint.identifier = identifier

    NSLayoutConstraint.activate([constraint])
    return constraint
  }

  var firstView: UIView? {
    return firstItem as? UIView
  }

  var secondView: UIView? {
    return secondItem as? UIView
  }
}
