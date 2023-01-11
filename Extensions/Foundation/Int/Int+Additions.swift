//
//  Int+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension Int {

  static let zero = 0

  var string: String {
    return String(self)
  }

  var isZero: Bool {
    return self == 0
  }

  var isNotZero: Bool {
    return !isZero
  }

  var number: NSNumber {
    return NSNumber(value: self)
  }

  var double: Double {
    return Double(self)
  }

  var incremented: Int {
    return self + 1
  }

  static let invalid: Int = NSNotFound

  init?(_ value: String?) {
    guard let value = value else { return nil }
    self.init(value)
  }

  var indexSet: IndexSet {
    return IndexSet(integer: self)
  }

  func days(in unit: Unit) -> Int {
    return self * 24 * unit.rawValue
  }

  func hours(from unit: Unit) -> Int {
    return self / unit.rawValue
  }

  var minutesAndSeconds: (minutes: Int, remainingSeconds: Int) {
    let remainder = Int(Float(self).truncatingRemainder(dividingBy: Float(Unit.minutes.rawValue)))
    return (
      (self - remainder) / Unit.minutes.rawValue,
      remainder
    )
  }

  enum Unit: Int {
    case seconds = 3600
    case minutes = 60
  }

  var ordinal: String {
    if let value = NumberFormatter.ordinal.string(from: number) {
      return value
    }
    return .empty
  }

  var range: Range<Int> {
    return 0..<self
  }

  var emptyIfZero: String {
    return isZero ? .empty : string
  }
}

// MARK: - Formatting

public extension Int {

  func limit(to max: Int) -> String {
    if self <= 0 {
      return .empty
    }
    else if 0...max ~= self {
      return string
    }
    else {
      return "\(max)+"
    }
  }
}

// MARK: - Optionals

public extension Optional where Wrapped == Int {

  var zeroIfNil: Wrapped {
    return ifNil(.zero)
  }
}
