//
//  Measurement+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public typealias Angle = Measurement<UnitAngle>

public extension Measurement where UnitType == UnitAngle {

  init(_ degrees: Double) {
    self.init(value: degrees, unit: .degrees)
  }

//	var radians: CGFloat {
//    return CGFloat(converted(to: .radians).value)
//  }
}
