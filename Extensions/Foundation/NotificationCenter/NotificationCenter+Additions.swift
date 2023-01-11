//
//  NotificationCenter+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public extension NotificationCenter {

  func observe(name: Notification.Name, object: Any? = nil,
               queue: OperationQueue = .main,
               using block: @escaping Callback<Notification>) -> NotificationToken {
    let token = addObserver(forName: name, object: object, queue: queue, using: block)
    return NotificationToken(notificationCenter: self, token: token)
  }

  func observe(names: [Notification.Name], object: Any? = nil,
               queue: OperationQueue = .main,
               using block: @escaping Callback<Notification>) -> [NotificationToken] {
    return names.map { name in
      observe(name: name, object: object, queue: queue, using: block)
    }
  }

  func enqueue(name: Notification.Name, object: Any? = nil, userInfo: [Notification.UserInfoKey: Any]? = nil) {
    let queue = NotificationQueue(notificationCenter: self)
    let notification = name.notification(object: object, userInfo: userInfo)

    queue.enqueue(notification, postingStyle: .asap, coalesceMask: .onName, forModes: .none)
  }
}

// MARK: Notification.Name

public extension Notification.Name {

  func notification(object: Any? = nil, userInfo: [Notification.UserInfoKey: Any]? = nil) -> Notification {
    return Notification(name: self, object: object, userInfo: userInfo)
  }
}
