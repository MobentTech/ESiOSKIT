//
//  Bool+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == Bool {

  var falseIfNil: Wrapped {
    return ifNil(false)
  }
}

extension Bool {

  public var integer: Int {
    return self ? 1 : 0
  }
}
