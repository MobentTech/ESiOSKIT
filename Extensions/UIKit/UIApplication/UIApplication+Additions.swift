//
//  UIApplication+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIApplication {

  static var isXCTestLibraryAvailable: Bool {
    return NSClassFromString("XCTestCase") != nil
  }

  func makeWindowKeyAndVisible() {
    if let window = delegate?.window {
      window?.makeKeyAndVisible()
    }
  }

  func settings() {
    openURL(urlString: UIApplication.openSettingsURLString)
  }

  func call(_ phone: String) {
    openURL(urlString: "tel://\(phone)")
  }

  func openSettingsIfNeeded() {
    if !UIApplication.shared.isRegisteredForRemoteNotifications {
      settings()
    }
  }

  private func openURL(urlString: String) {
    guard let url = URL(string: urlString), canOpenURL(url) else { return }
    open(url)
  }
}
