//
//  UIVisualEffectView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIVisualEffectView {

  convenience init(blur: UIBlurEffect.Style) {
    self.init(effect: UIBlurEffect(style: blur))
  }
}
