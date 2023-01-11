//
//  UISlider+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

extension UISlider {

  func setHidableValue(value: Float?, animated: Bool) {
    isHidden = (value == nil)
    setValue(value.ifNil(.zero), animated: animated)
  }
}
