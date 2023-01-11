//
//  DateFormatter+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension DateFormatter {

  static let timeFormat: String = {
    return dateFormat(fromTemplate: "jm", options: 0, locale: .autoupdatingCurrent).ifNil("h:mm a")
  }()

  static let today: DateFormatter = {
    return DateFormatter(timeFormat, timeZone: .autoupdatingCurrent)
  }()

  static let weekday: DateFormatter = {
    return DateFormatter("EEE, \(timeFormat)")
  }()

  static let monthAndDay: DateFormatter = {
    return DateFormatter("MMM '%@'")
  }()

  static let hoursMonthDayYear: DateFormatter = {
    return DateFormatter("\(timeFormat) 'on' MMM '%@' yyyy")
  }()

  static let monthDayHours: DateFormatter = {
    return DateFormatter("MMM '%@', \(timeFormat)")
  }()

  static let yearMonthDay: DateFormatter = {
    return DateFormatter("yyyy-MM-dd")
  }()

  static let registration: DateFormatter = {
    return DateFormatter("MM/dd/yyyy, hh:mm")
  }()

  static let register: DateFormatter = {
    return DateFormatter("yyyy-MM-dd", timeZone: .utc)
  }()

  static let trainindDetail: DateFormatter = {
    return DateFormatter("dd.MM.yyyy", timeZone: .utc)
  }()

  static let content: DateFormatter = {
    return DateFormatter("dd MMM yyyy", timeZone: .utc)
  }()

  static let nationalID: DateFormatter = {
    return DateFormatter("yyMMdd", timeZone: .utc)
  }()

  static func reminder(with timeZone: TimeZone) -> DateFormatter {
    return DateFormatter("dd MMM yyyy 'at' \(timeFormat) '\(timeZone.abbreviation)'", timeZone: timeZone)
  }

  static func time(with timeZone: TimeZone) -> DateFormatter {
    return DateFormatter("\(timeFormat) '\(timeZone.abbreviation)'", timeZone: timeZone)
  }

  convenience init(_ format: String, locale: Locale = .autoupdatingCurrent, timeZone: TimeZone = .autoupdatingCurrent) {
    self.init()

    self.dateFormat = format
    self.locale = locale
    self.timeZone = timeZone
  }

  func formatted(with dateFormat: String, timeZone: TimeZone) -> DateFormatter {
    self.dateFormat = String(format: dateFormat, "'\(timeZone.abbreviation)'")
    self.timeZone = timeZone

    return self
  }
}
