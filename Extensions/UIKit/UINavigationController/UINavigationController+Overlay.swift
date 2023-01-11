//
//  UINavigationController+Overlay.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UINavigationController {

  private struct AssociationKeys {
    public static var barOverlay = "ws_v_barOverlay"
  }

  private var barOverlay: UIView {
    if let overlay = objc_getAssociatedObject(self, &AssociationKeys.barOverlay) as? UIView {
      return overlay
    }

    let overlay = UIView(background: navigationBar.barTintColor.ifNil(UIColor.black))
    overlay.isUserInteractionEnabled = false
    overlay.alpha = .zero

    view.insertSubview(overlay, belowSubview: navigationBar)

    overlay.translatesAutoresizingMaskIntoConstraints = false
    overlay.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    overlay.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true

    objc_setAssociatedObject(self, &AssociationKeys.barOverlay, overlay, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    return overlay
  }

  func setBarOverlayAlpha(to alpha: CGFloat, animated: Bool = false) {
    if animated {
      UIView.animate(withDuration: 0.2) { self.barOverlay.alpha = alpha }
    }
    else {
      barOverlay.alpha = alpha
    }
  }

  func resetBarOverlay() {
    setBarOverlayAlpha(to: 0)
  }
}
