//
//  CGRect+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import CoreGraphics

public extension CGRect {

  init(center: CGPoint, size: CGSize) {
    let origin = CGPoint(x: center.x - (size.width / 2), y: center.y - (size.height / 2))
    self.init(origin: origin, size: size)
  }
}
