//
//  Notification+UserInfoKey.swift
//  BenzinLitre
//
//  Created by Emre Çiftçi on 8.08.2021.
//  Copyright © 2021 Benzinlitre. All rights reserved.
//

import Foundation

public extension Notification {

  struct UserInfoKey: ExpressibleByStringLiteral, Hashable {

    private let value: String

    public init(stringLiteral value: String) {
      self.value = value
    }

    public func hash(into hasher: inout Hasher) {
      hasher.combine(value)
    }
  }
}

// Please add more user info keys here when needed.
// Please consider the naming.

public extension Notification.UserInfoKey {

  static let balance: Notification.UserInfoKey = "UserInfoKey.BalanceCount"
  static let ipv4Addresses: Notification.UserInfoKey = "UserInfoKey.ipv4Addresses"
  static let user: Notification.UserInfoKey = "UserInfoKey.User"
  static let notificationCount: Notification.UserInfoKey = "UserInfoKey.NotificationCount"

  static let profile: Notification.UserInfoKey = "UserInfoKey.Profile"
}

// MARK: - Notification

public extension Notification {

  subscript<T: Any>(key: Notification.UserInfoKey) -> T? {
    return userInfo?[key] as? T
  }
}
