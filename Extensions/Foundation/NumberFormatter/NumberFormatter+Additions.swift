//
//  NumberFormatter+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension NumberFormatter {

  static let ordinal: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .ordinal

    return numberFormatter
  }()

  static func handicap(signed: Bool) -> NumberFormatter {
    return signed ? .signedHandicap : .unsignedHandicap
  }

  static func decimal(limited: Bool) -> NumberFormatter {
    return limited ? .limitedFractionalDecimal : .unlimitedFractionalDecimal
  }
}

// MARK: - Handicap

fileprivate extension NumberFormatter {

  static let signedHandicap: NumberFormatter = {
    let numberFormatter = NumberFormatter()

    numberFormatter.maximumFractionDigits = 2
    numberFormatter.minimumFractionDigits = 1
    numberFormatter.numberStyle = .decimal
    numberFormatter.positivePrefix = "+"

    return numberFormatter
  }()

  static let unsignedHandicap: NumberFormatter = {
    let numberFormatter = NumberFormatter()

    numberFormatter.maximumFractionDigits = 2
    numberFormatter.minimumFractionDigits = 1
    numberFormatter.numberStyle = .decimal
    numberFormatter.positivePrefix = ""
    numberFormatter.negativePrefix = ""

    return numberFormatter
  }()
}

// MARK: - Decimal

fileprivate extension NumberFormatter {

  static let unlimitedFractionalDecimal: NumberFormatter = {
    let numberFormatter = NumberFormatter()

    numberFormatter.locale = .autoupdatingCurrent
    numberFormatter.maximumFractionDigits = Int.max
    numberFormatter.generatesDecimalNumbers = true

    return numberFormatter
  }()

  static let limitedFractionalDecimal: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.locale = .autoupdatingCurrent

    numberFormatter.maximumFractionDigits = 2
    numberFormatter.minimumFractionDigits = 0

    numberFormatter.generatesDecimalNumbers = true
    return numberFormatter
  }()
}
