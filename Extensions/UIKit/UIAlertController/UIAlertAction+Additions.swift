//
//  UIAlertAction+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIAlertAction {

  convenience init(_ localizableTitle: String, style: UIAlertAction.Style = .default, action: @escaping VoidCallback) {
    self.init(title: localizableTitle.localized, style: style) { _ in action() }
  }

  class func cancel(
    style: UIAlertAction.Style = .cancel,
    action: @escaping VoidCallback = voidCallback()) -> UIAlertAction
  {
    return UIAlertAction("general.cancel".localized, style: style, action: action)
  }

  class func no() -> UIAlertAction {
    return UIAlertAction("general.no".localized, action: voidCallback())
  }

  class func ok(action: @escaping VoidCallback = voidCallback()) -> UIAlertAction {
    return UIAlertAction("general.ok".localized, action: action)
  }

  class func yes(action: @escaping VoidCallback) -> UIAlertAction {
    return UIAlertAction("general.yes".localized, action: action)
  }
}
