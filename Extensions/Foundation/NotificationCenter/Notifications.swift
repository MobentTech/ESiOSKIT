//
//  Notifications.swift
//  BenzinLitre
//
//  Created by Emre Çiftçi on 8.08.2021.
//  Copyright © 2021 Benzinlitre. All rights reserved.
//

import Foundation
import UIKit

public struct Notifications {

  public struct Application {
    public static let deviceTokenReceived = Notification.Name("DidReceiveDeviceTokenNotification")
    public static let shouldRefresh = Notification.Name("ShouldRefreshNotification")
  }

	public struct Authentication {
    public static let loggedIn = Notification.Name("DidUserLoginNotification")
    public static let loggedOut = Notification.Name("DidUserLogoutNotification")
    public static let registered = Notification.Name("DidUserRegisterNotification")
  }

  public struct Balance {
    public static let balanceChanged = Notification.Name("DidChangeBalanceNotification")
  }

  public struct Connectivity {
    public static let connectivityChanged = Notification.Name("DidChangeConnectivityNotification")
    public static let connectivityTypeChanged = Notification.Name("DidChangeConnectivityTypeNotification")
    public static let ipv4AddressChanged = Notification.Name("DidChangeIPv4AddressNotification")
  }

  public struct Message {
    public static let messageWillDisplay = Notification.Name("WillDisplayMessageNotification")
    public static let messageClosed = Notification.Name("DidCloseMessageNotification")
  }

  public struct NotificationCount {
    public static let countChanged = Notification.Name("DidChangeNotificationCountNotification")
  }

  public struct Profile {
    public static let profileDidUpdate = Notification.Name("DidUpdateProfileNotification")
  }
}

///
/// Attention: Syntactic sugar happening here.
///
/// This part is totally optional. If you add your notification keys here,
/// they will be treated as variables of type `Notification.Name`, enabling you
/// to do the following:
///
/// NotificationCenter.default.enqueue(.connectivityChanged)
///
/// instead of
///
/// NotificationCenter.default.enqueue(Notifications.Connectivity.connectivityChanged)
///

public extension Notification.Name {

  // UIApplication

  static let applicationDidReceiveDeviceToken = Notifications.Application.deviceTokenReceived
  static let applicationShouldRefresh = Notifications.Application.shouldRefresh
  static let applicationDidEnterBackground = UIApplication.didEnterBackgroundNotification
  static let applicationWillEnterForeground = UIApplication.willEnterForegroundNotification
  static let applicationDidBecomeActive = UIApplication.didBecomeActiveNotification
  static let applicationDidReceiveMemoryWarning = UIApplication.didReceiveMemoryWarningNotification

  // Connectivity

  static let connectivityChanged = Notifications.Connectivity.connectivityChanged
  static let connectivityTypeChanged = Notifications.Connectivity.connectivityTypeChanged
  static let ipv4AddressChanged = Notifications.Connectivity.ipv4AddressChanged

  static let messageWillDisplay = Notifications.Message.messageWillDisplay
  static let messageClosed = Notifications.Message.messageClosed

	// Authentication

  static let userLoggedIn = Notifications.Authentication.loggedIn
  static let userLoggedOut = Notifications.Authentication.loggedOut
  static let userRegistered = Notifications.Authentication.registered

  // Notification Count

  static let notificationCountChanged = Notifications.NotificationCount.countChanged

  // AVPlayer

  static let playerDidFinish = AVPlayerItemDidPlayToEndTime

  // Balance

  static let balanceDidChange = Notifications.Balance.balanceChanged

  // Profile

  static let profileDidUpdate = Notifications.Profile.profileDidUpdate
}
