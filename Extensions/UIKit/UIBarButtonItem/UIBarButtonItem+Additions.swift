//
//  UIBarButtonItem+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {

  convenience init(flexibleWidth: CGFloat) {
    self.init(barButtonSystemItem: .flexibleSpace)
    self.width = flexibleWidth
  }

  convenience init(fixedWidth: CGFloat) {
    self.init(barButtonSystemItem: .fixedSpace)
    self.width = fixedWidth
  }

  convenience init(barButtonSystemItem: UIBarButtonItem.SystemItem) {
    self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
  }
}

// MARK: - IBInspectable

public extension UIBarButtonItem {

  @IBInspectable var localizedText: String? {
    get {
      return .empty // Can not get localized text key
    }
    set {
      title = newValue?.localized
    }
  }
}
