//
//  NotificationToken.swift
//  BenzinLitre
//
//  Created by Emre Çiftçi on 8.08.2021.
//  Copyright © 2021 Benzinlitre. All rights reserved.
//

import Foundation

public final class NotificationToken: NSObject {

  public let notificationCenter: NotificationCenter
  public let token: Any

  public init(notificationCenter: NotificationCenter, token: Any) {
    self.notificationCenter = notificationCenter
    self.token = token
  }

  deinit {
    notificationCenter.removeObserver(token)
  }
}
