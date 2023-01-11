//
//  UIView+TapGestureRecognizer.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIView {

  private struct AssociationKeys {
    public static var tapGestureRecognizer = "ws_v_tapGestureRecognizer"
    public static var tapGestureRecognizerAction = "ws_v_tapGestureRecognizerAction"
  }

  private var tapGestureRecognizerAction: Callback<UIView>? {
    get {
      return objc_getAssociatedObject(self, &AssociationKeys.tapGestureRecognizerAction) as? Callback<UIView>
    }
    set {
      objc_setAssociatedObject(self, &AssociationKeys.tapGestureRecognizerAction, newValue, .OBJC_ASSOCIATION_COPY)
    }
  }

  private var tapGestureRecognizer: UITapGestureRecognizer {
    if let tapGestureRecognizer = objc_getAssociatedObject(self, &AssociationKeys.tapGestureRecognizer)
      as? UITapGestureRecognizer
    {
      return tapGestureRecognizer
    }

    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ws_v_tapGestureRecognized))

    objc_setAssociatedObject(
      self, &AssociationKeys.tapGestureRecognizer, tapGestureRecognizer,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )
    return tapGestureRecognizer
  }

  func addTapGestureRecognizer(cancelsTouches: Bool = true, action: @escaping Callback<UIView>) {
    tapGestureRecognizerAction = action
    tapGestureRecognizer.cancelsTouchesInView = cancelsTouches

    isUserInteractionEnabled = true
    addGestureRecognizer(tapGestureRecognizer)
  }

  @objc private func ws_v_tapGestureRecognized() {
    tapGestureRecognizerAction?(self)
  }
}
