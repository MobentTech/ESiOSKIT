//
//  URLComponents+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension URLComponents {

  /// Updates path component by prepending path separator
  /// if there is not any.
  mutating func addLeadingPathSeparator() {
    if !path.hasPrefix(.slash) {
      path = "\(String.slash)\(path)"
    }
  }
}
