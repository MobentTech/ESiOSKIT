//
//  Bundle+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 13.03.2022.
//

import Foundation

public extension Bundle {

  static var firstPreferredLocalization: String {
    Bundle.main.preferredLocalizations.first.ifNil("en")
  }
}
