//
//  Calendar+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

fileprivate extension Calendar.Component {

  var localizedAbbreviatedDescription: String {
    switch self {
    case .day:
      return "Formatter.Abbreviations.Day".localized

    case .hour:
      return "Formatter.Abbreviations.Hour".localized

    case .minute:
      return "Formatter.Abbreviations.Minute".localized

    default:
      return .empty
    }
  }
}

// MARK: - DateComponentResult

public extension Array where Element == DateComponentResult {

  var localizedAbbreviatedDescription: String {
    return map { "\($0.value)\($0.component.localizedAbbreviatedDescription)" }.joined(separator: .whitespace)
  }
}
