//
//  NSRange+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension NSRange {

  var isValid: Bool {
    return !isInvalid
  }

  var isInvalid: Bool {
    return self.location == .invalid
  }

  func toRange(string: String) -> Range<String.Index> {
    let startIndex = string.index(string.startIndex, offsetBy: location)
    let endIndex = string.index(startIndex, offsetBy: length)

    return startIndex..<endIndex
  }
}
