//
//  Date+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public typealias DateComponentResult = (component: Calendar.Component, value: Int)

public extension Date {

  static var now: Date {
    return Date()
  }

  var isToday: Bool {
    return Calendar.autoupdatingCurrent.isDateInToday(self)
  }

  var isTomorrow: Bool {
    return Calendar.autoupdatingCurrent.isDateInTomorrow(self)
  }

  var isLessThanMonth: Bool {
    return isOlderThan(days: 30)
  }

  func isOlderThan(days: Int) -> Bool {
    return 0 ..< Double(days.days(in: .seconds)) ~= timeIntervalSinceNow
  }

  func isNewerThan(days: Int) -> Bool {
    return !isOlderThan(days: days)
  }

  func string(using formatter: DateFormatter) -> String {
    return formatter.string(from: self)
  }

  enum Unit {
    case hours
    case minutes
  }

  func sinceNow(with unit: Unit) -> Int {

    if unit == .hours {
      return Int(self.timeIntervalSinceNow / 3600)
    } else {
      return Int((self.timeIntervalSinceNow / 60)) % 60
    }
  }

  var beginningOfDay: Date {
    return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
  }

  var endOfDay: Date {
    return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
  }

  func date(byAddingYear year: Int) -> Date {
    if let date = Calendar(identifier: .gregorian).date(byAdding: .year, value: year, to: self) {
      return date
    }
    return self
  }

  func date(byAddingDays day: Int) -> Date {
    if let date = Calendar(identifier: .gregorian).date(byAdding: .day, value: day, to: self) {
      return date
    }
    return self
  }

  func date(byAddingMonths month: Int) -> Date {
    if let date = Calendar(identifier: .gregorian).date(byAdding: .month, value: month, to: self) {
      return date
    }
    return self
  }
}

// MARK: - TimeInterval

public extension TimeInterval {

  var date: Date {
    return Date(timeIntervalSince1970: self)
  }

  var minutes: Int {
    return Int(self / 60.0)
  }
}

// MARK: - Components

public extension Date {

  static func components(
    _ components: [Calendar.Component], from date: Date, to toDate: Date) -> [DateComponentResult]
  {
    let interval = Calendar.current.dateComponents(Set(components), from: date, to: toDate)

    return components.map { ($0, interval.value(for: $0)!) }
  }

  /// Returns first non-zero component
  ///
  /// - Example:
  ///
  /// ```
  ///   let date = Date.now.addingTimeInterval(3600)
  ///   // Difference from now is 0 day, 0 hour, 1 minute
  ///
  ///   date.firstNonZeroComponent()
  ///   // (component: .minute, value: 1)
  /// ```
  ///
  /// - Parameters:
  ///   - components: Ordered Calendar Components. Default value is [.day, .hour,. minute].
  ///   - date: The starting date. Default value is Date.now.
  func firstNonZeroComponent(
    _ components: [Calendar.Component] = [.day, .hour, .minute], from date: Date = .now) -> DateComponentResult?
  {
    return Date.components(components, from: date, to: self).first(where: { $0.value > 0 })
  }

  func nonZeroComponents(
    _ components: [Calendar.Component] = [.day, .hour, .minute], from date: Date = .now) -> [DateComponentResult]
  {
    return Date.components(components, from: date, to: self).filter { $0.value > 0 }
  }

  var day: Int {
    return Calendar.current.component(.day, from: self)
  }

  func years(to date: Date) -> Int {
    return Date.components([.year], from: self, to: date)[0].value
  }
}
