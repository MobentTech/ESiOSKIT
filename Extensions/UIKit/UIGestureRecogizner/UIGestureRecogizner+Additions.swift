//
//  UIGestureRecognizer+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIGestureRecognizer {

  func cancel() {
    isEnabled = false
    isEnabled = true
  }
}

public extension UILongPressGestureRecognizer {

  func allowableMovementExceeded() -> Bool {
    guard let view = view else { return false }

    let location = self.location(in: view)
    return view.center.distance(to: location) > allowableMovement
  }
}
