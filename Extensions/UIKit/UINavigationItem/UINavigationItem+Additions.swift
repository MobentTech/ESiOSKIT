//
//  UINavigationItem+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UINavigationItem {

  func setBackButton(action: @escaping VoidCallback) {
    hidesBackButton = true
    leftBarButtonItem = UIBarButtonItem(customView: UIButton.back(action: action))
  }
}
