//
//  UIView+Blur.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

private struct Constants {
  public static let color = UIColor.black.withAlphaComponent(0.5)
}

public extension UIView {

  private struct AssociationKeys {
    public static var blurView = "ws_v_blurView"
  }

  private var blurView: UIView {
    if let view = objc_getAssociatedObject(self, &AssociationKeys.blurView) as? UIView {
      return view
    }

    let view = UIView(background: Constants.color)
    view.addSubviewAndConstraintToEdges(UIVisualEffectView(blur: .dark))
    view.isUserInteractionEnabled = false
    view.alpha = 0

    addSubviewAndConstraintToEdges(view)

    objc_setAssociatedObject(self, &AssociationKeys.blurView, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    return view
  }

  // MARK: API

  func setBlur(to alpha: CGFloat) {
    blurView.alpha = alpha
  }

  func showBlur(animated: Bool) {
    blurView.setAlpha(1.0, animated: animated)
  }

  func hideBlur(animated: Bool) {
    blurView.setAlpha(0.0, animated: animated)
  }
}
