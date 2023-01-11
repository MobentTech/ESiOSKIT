//
//  UIResponder+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIResponder {

  @objc class var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
}
