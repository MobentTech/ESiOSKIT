//
//  CGFloat+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import CoreGraphics

public extension CGFloat {

  static var max: CGFloat {
    return .greatestFiniteMagnitude
  }

  static var min: CGFloat {
    return .leastNormalMagnitude
  }

  var radian: CGFloat {
    return self * .pi / 180.0
  }
}
