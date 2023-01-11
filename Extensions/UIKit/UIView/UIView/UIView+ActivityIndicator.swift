//
//  UIView+ActivityIndicator.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIView {

  private struct AssociationKeys {
    public static var activityIndicatorView = "ws_v_activityIndicatorView"
  }

  @objc var activityIndicatorView: UIActivityIndicatorView {
    if let activityIndicatorView = objc_getAssociatedObject(
      self, &AssociationKeys.activityIndicatorView) as? UIActivityIndicatorView
    {
      return activityIndicatorView
    }

    let activityIndicatorView = UIActivityIndicatorView.create(style: .white)
    activityIndicatorView.hidesWhenStopped = true
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false

    addSubviewAndConstraintToSafeAreaEdges(activityIndicatorView)

    objc_setAssociatedObject(self, &AssociationKeys.activityIndicatorView,
      activityIndicatorView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    return activityIndicatorView
  }

  func startLoadingIndicatorView(color: UIColor) {
    activityIndicatorView.color = color
    startLoadingIndicatorView()
  }

  @objc func startLoadingIndicatorView() {
    activityIndicatorView.startAnimating()
  }

  @objc func stopLoadingIndicatorView() {
    activityIndicatorView.stopAnimating()
  }
}
