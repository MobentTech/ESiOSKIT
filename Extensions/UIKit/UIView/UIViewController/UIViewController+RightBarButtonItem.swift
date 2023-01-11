//
//  UIViewController+RightBarButtonItem.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIViewController {

  private struct AssociationKeys {
    public static var activityIndicatorView = "ec_vc_activityIndicatorView"
    public static var rightBarButtonItem = "ec_vc_rightBarButtonItem"
  }

  private var ec_activityIndicatorView: UIActivityIndicatorView {
    if let activityIndicatorView = objc_getAssociatedObject(self, &AssociationKeys.activityIndicatorView)
      as? UIActivityIndicatorView
    {
      return activityIndicatorView
    }

    let activityIndicatorView = UIActivityIndicatorView.create(style: .white)
    activityIndicatorView.hidesWhenStopped = true

    objc_setAssociatedObject(
      self,
      &AssociationKeys.activityIndicatorView,
      activityIndicatorView,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    return activityIndicatorView
  }

  private var ec_rightBarButtonItem: UIBarButtonItem? {
    get {
      return objc_getAssociatedObject(self, &AssociationKeys.rightBarButtonItem) as? UIBarButtonItem
    }
    set {
      objc_setAssociatedObject(self, &AssociationKeys.rightBarButtonItem, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  func showRightBarLoadingIndicatorView() {
    if navigationItem.rightBarButtonItem?.customView != ec_activityIndicatorView {
      ec_rightBarButtonItem = navigationItem.rightBarButtonItem
    }

    // These two lines are for preventing `AMScrollingNavbar` library from messing up with `alpha` of this indicator.
    ec_activityIndicatorView.alpha = 1.0
    ec_activityIndicatorView.subviews(ofType: UIImageView.self).forEach { $0.alpha = 1.0 }

    ec_activityIndicatorView.startAnimating()

    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ec_activityIndicatorView)
  }

  func hideRightBarLoadingIndicatorView() {
    if ec_activityIndicatorView.isAnimating {
      ec_activityIndicatorView.stopAnimating()
      navigationItem.rightBarButtonItem = ec_rightBarButtonItem
    }
  }
}
