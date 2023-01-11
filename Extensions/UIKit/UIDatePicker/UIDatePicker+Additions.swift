//
//  UIDatePicker+Additions.swift
//  E-Commerce
//
//  Created by Emre Çiftçi on 8.02.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIDatePicker {

  func setPreferredDatePickerStyle() {
    if #available(iOS 13.4, *) {
      preferredDatePickerStyle = .wheels
    }
  }
}
