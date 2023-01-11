//
//  UIWindow+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIWindow {

  func setRootViewController(_ viewController: UIViewController, animated: Bool) {

    if animated, let oldView = snapshotView(afterScreenUpdates: true) {
      viewController.view.setAlpha(0.0, animated: false)
      rootViewController = viewController

      addSubviewAndConstraintToEdges(oldView)

      UIView.animate(
        withDuration: 0.2,
        options: UIView.AnimationOptions.curveLinear,
        animations: {
          viewController.view.setAlpha(1.0, animated: false)
          oldView.setAlpha(0.0, animated: false)
        },
        completion: { _ in
          oldView.removeFromSuperview()
        }
      )
    }
    else {
      rootViewController = viewController
    }
  }
}
