//
//  TimeZone+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension TimeZone {

  static let utc = TimeZone(abbreviation: "UTC")!

  var abbreviation: String {
    return abbreviation().ifNil(description)
  }
}
