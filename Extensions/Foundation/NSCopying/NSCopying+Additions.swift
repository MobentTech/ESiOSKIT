//
//  NSCopying+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension NSCopying {

  func copied<T>(with zone: NSZone? = nil) -> T {
    return copy(with: zone) as! T
  }
}
