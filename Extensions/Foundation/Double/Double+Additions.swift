//
//  Double+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension Double {

  init?(_ text: String?) {
    guard let text = text else { return nil }
    self.init(text)
  }

  var number: NSNumber {
    return NSNumber(value: self)
  }

  var cg: CGFloat {
    return CGFloat(self)
  }

  var string: String {
    return .init(self)
  }

  var roundedHalfDown: Double {
    return self >= 0 ? nextDown.rounded() : nextUp.rounded()
  }

  var roundedHalfUp: Double {
    return nextUp.rounded()
  }

  var megabytes: Double {
    return self * 1024 * 1024
  }

  func signed(places: Int, emptyIfZero: Bool = true) -> String {
    if self == 0 && emptyIfZero {
      return .empty
    }
    let sign = self > 0 ? "+" : .empty
    return "\(sign)\(String(format: "%.\(places)f", self))"
  }

  func truncated(places: Int) -> Double {
    let powered = pow(10, Double(places))
    return floor((powered * self).nextUp) / powered
  }

  func rounded(places: Int) -> Double {
    let value = truncated(places: places + 1)
    let powered = pow(10, Double(places))
    return (powered * value).roundedHalfUp / powered
  }

  static func averaged(low: Double, high: Double) -> Double {
    return (low + high) / 2.0
  }
}

// MARK: - Currency

public extension Double {

//  var currencyStyled: String? {
//    return currencyStyled(fraction: 2)
//  }

//  func currencyStyled(fraction: Int) -> String? {
//    return currencyStyled(fractions: fraction...fraction)
//  }

  /// Converted String for specified fractions
  ///
  ///  - Examples:
  ///
  ///  ```
  ///     let intValue = 2.0
  ///     let value = 2.432
  ///
  ///     value.currencyStyled(fractions: 0...0) ~ "2"
  ///     value.currencyStyled(fractions: 0...1) ~ "2.4"
  ///
  ///     intValue.currency(fractions: 0...1) ~ "2"
  ///     intValue.currency(fractions: 1...1) ~ "2.0"
  ///
  ///  ```
  /// - Parameter fractions: CountableClosedRange.lowerBound is minimumFraction
  /// CountableClosedRange.upperBound is maximumFraction
//  func currencyStyled(fractions: CountableClosedRange<Int>) -> String? {
//    NumberFormatter.currency(fractions: fractions).string(from: number)
//  }
}

// MARK: - OddConversion

public protocol OddConversion {
  static func convert(_ value: Double) -> Double
}

public extension Double {

//  var decimalOddStyled: String {
//    return self.convert(conversion: FromDecimalOddConversion.self).oddFormatted
//  }

  func convert<C: OddConversion>(conversion: C.Type) -> Double {
		C.convert(self)
  }
}
