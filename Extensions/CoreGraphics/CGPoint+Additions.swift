//
//  CGPoint+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import CoreGraphics

public extension CGPoint {

  func adding(x: CGFloat) -> CGPoint {
    return CGPoint(x: (self.x + x), y: y)
  }

  func adding(y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: (self.y + y))
  }

  func distance(to point: CGPoint) -> CGFloat {
    return CGFloat(hypotf(Float(x - point.x), Float(y - point.y)))
  }

  // swiftlint:disable:next operator_whitespace
  static prefix func -(point: CGPoint) -> CGPoint {
    return CGPoint(x: -point.x, y: -point.y)
  }
  // swiftlint:enable operator_whitespace

  static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }

  static func /(lhs: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: (lhs.x / value), y: (lhs.y / value))
  }
}
