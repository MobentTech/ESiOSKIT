//
//  CALayer+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension CALayer {

  static var allCorners: CACornerMask {
    return [
      .layerMinXMinYCorner, .layerMaxXMinYCorner,
      .layerMinXMaxYCorner, .layerMaxXMaxYCorner
    ]
  }

  static var topCorners: CACornerMask {
    return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }

  static var bottomCorners: CACornerMask {
    return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
  }

  static var leftCorners: CACornerMask {
    return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
  }

  static var rightCorners: CACornerMask {
    return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
  }

  func removeAllSublayers() {
    sublayers?.forEach { $0.removeFromSuperlayer() }
  }

  func setAnchorPoint(_ point: CGPoint) {
    var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
    var oldPoint = CGPoint(x: bounds.size.width * anchorPoint.x, y: bounds.size.height * anchorPoint.y)

    newPoint = newPoint.applying(CATransform3DGetAffineTransform(transform))
    oldPoint = oldPoint.applying(CATransform3DGetAffineTransform(transform))

    var currentPosition = position

    currentPosition.x -= oldPoint.x
    currentPosition.x += newPoint.x

    currentPosition.y -= oldPoint.y
    currentPosition.y += newPoint.y

    position = currentPosition
    anchorPoint = point
  }
}
