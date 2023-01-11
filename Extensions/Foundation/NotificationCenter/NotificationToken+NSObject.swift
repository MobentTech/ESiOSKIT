//
//  NotificationToken+NSObject.swift
//  BenzinLitre
//
//  Created by Emre Çiftçi on 8.08.2021.
//  Copyright © 2021 Benzinlitre. All rights reserved.
//

import Foundation

public extension NSObject {

  private struct AssociationKeys {
    public static var notificationTokens = "ec_notificationTokens"
  }

  private func ec_setNotificationTokens(_ tokens: [NotificationToken]) {
    objc_setAssociatedObject(
      self, &AssociationKeys.notificationTokens, tokens, .OBJC_ASSOCIATION_COPY_NONATOMIC
    )
  }

  func removeAllNotifications() {
    ec_setNotificationTokens([])
  }

  func addNotifications(_ tokens: [NotificationToken]) {
    if var notificationTokens =
      objc_getAssociatedObject(self, &AssociationKeys.notificationTokens) as? [NotificationToken]
    {
      notificationTokens.append(contentsOf: tokens)
      ec_setNotificationTokens(notificationTokens)
    }
    else {
      ec_setNotificationTokens(tokens)
    }
  }

  func addNotifications(_ tokens: NotificationToken...) {
    addNotifications(tokens)
  }
}
