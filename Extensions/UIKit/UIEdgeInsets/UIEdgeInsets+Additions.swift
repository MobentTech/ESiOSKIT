//
//  UIEdgeInsets+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {

  init(edges: CGFloat) {
    self.init(horizontal: edges, vertical: edges)
  }

  init(horizontal: CGFloat, vertical: CGFloat) {
    self.init(top: vertical, left: horizontal,
              bottom: vertical, right: horizontal)
  }

  var negated: UIEdgeInsets {
    return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
  }

  mutating func negate() {
    self = negated
  }

  var horizontal: CGFloat {
    return left + right
  }

  var vertical: CGFloat {
    return top + bottom
  }
}
