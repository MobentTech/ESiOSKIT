//
//  UIButton+Action.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIButton {

  private struct AssociationKeys {
    public static var touchUpInsideBlock = "ec_button_touchUpInsideBlock"
  }

  var touchUpInsideAction: Callback<UIButton>? {
    get {
      return objc_getAssociatedObject(self, &AssociationKeys.touchUpInsideBlock) as? Callback<UIButton>
    }
    set {
      removeTarget(self, action: #selector(ec_touchUpInsideActionTriggered), for: .touchUpInside)
      addTarget(self, action: #selector(ec_touchUpInsideActionTriggered), for: .touchUpInside)

      objc_setAssociatedObject(self, &AssociationKeys.touchUpInsideBlock, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }

  @objc private func ec_touchUpInsideActionTriggered() {
    touchUpInsideAction?(self)
  }
}
