//
//  CGSize+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import CoreGraphics

public extension CGSize {

  var ceiled: CGSize {
    return CGSize(width: ceil(width), height: ceil(height))
  }

  var toRect: CGRect {
    return CGRect(origin: .zero, size: self)
  }

  var center: CGPoint {
    return CGPoint(x: width / 2, y: height / 2)
  }

  var half: CGSize {
    return self / 2
  }

  var inverted: CGSize {
    return CGSize(width: height, height: width)
  }

  init(size: CGFloat) {
    self.init(width: size, height: size)
  }

  static let min = CGSize(width: .min, height: .min)

  // swiftlint:disable identifier_name operator_whitespace
  static func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
  }

  static func /(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
  }
  // swiftlint:enable identifier_name operator_whitespace
}
