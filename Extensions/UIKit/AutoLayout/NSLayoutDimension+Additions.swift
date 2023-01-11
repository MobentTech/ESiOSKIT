//
//  NSLayoutDimension+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension NSLayoutDimension {

  func constraint(equalToConstant c: CGFloat, priority: Int) -> NSLayoutConstraint {
    let constraint = self.constraint(equalToConstant: c)
    constraint.priority = UILayoutPriority(Float(priority))

    return constraint
  }
}
