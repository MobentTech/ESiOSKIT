//
//  Data+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension Data {

  static let empty = Data()
  static let error = Data(base64Encoded: "ZXJyb3I=")

  var deviceToken: String {
    return map { String(format: "%02.2hhx", $0) }.joined()
  }
}
