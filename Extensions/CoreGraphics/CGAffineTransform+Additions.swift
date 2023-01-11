//
//  CGAffineTransform+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import CoreGraphics

public extension CGAffineTransform {

  func scaled(by value: CGFloat) -> CGAffineTransform {
    return scaledBy(x: value, y: value)
  }

  func translated(by value: CGFloat) -> CGAffineTransform {
    return translatedBy(x: value, y: value)
  }
}
