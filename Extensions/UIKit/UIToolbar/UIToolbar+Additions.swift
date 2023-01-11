//
//  UIToolbar+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

extension UIToolbar {

  open override var intrinsicContentSize: CGSize {
    var newSize = super.intrinsicContentSize

    switch intrinsicStyle {
    case .compact:
      newSize.height = 44.0

    case .regular:
      newSize.height = 66.0
    }

    return newSize
  }

  open override func sizeThatFits(_ size: CGSize) -> CGSize {
    var fittedSize = super.sizeThatFits(size)
    fittedSize.width = superview?.frame.width ?? .zero

    switch intrinsicStyle {
    case .compact:
      fittedSize.height = 44.0

    case .regular:
      fittedSize.height = 66.0
    }

    return fittedSize
  }
}

// MARK: - IntrinsicState

public extension UIToolbar {

  enum IntrinsicStyle {
    case compact
    case regular
  }

  var intrinsicStyle: IntrinsicStyle {
    get {
      if let intrinsicState = objc_getAssociatedObject(self, &AssociationKeys.intrinsicState)
        as? IntrinsicStyle
      {
        return intrinsicState
      }

      objc_setAssociatedObject(
        self, &AssociationKeys.intrinsicState, IntrinsicStyle.compact, .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
      return IntrinsicStyle.compact
    }
    set {
      objc_setAssociatedObject(
        self, &AssociationKeys.intrinsicState, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }
  }

  private struct AssociationKeys {
    public static var intrinsicState = "ws_toolbar_intrinsicState"
  }
}
