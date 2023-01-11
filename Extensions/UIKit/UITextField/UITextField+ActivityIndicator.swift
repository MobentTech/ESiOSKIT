//
//  UITextField+ActivityIndicator.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UITextField {

  private struct AssociationKeys {
    public static var rightView = "ws_tf_rightview"
    public static var rightActivityIndicatorView = "ws_tf_rightactivityindicatorview"
    public static var rightViewMode = "ws_tf_rightviewmode"
  }

  private var ws_rightActivityIndicatorView: UIActivityIndicatorView {
    if let activityIndicatorView = objc_getAssociatedObject(self, &AssociationKeys.rightActivityIndicatorView)
      as? UIActivityIndicatorView
    {
      return activityIndicatorView
    }
    let activityIndicatorView = UIActivityIndicatorView(style: .gray)
    activityIndicatorView.transform = activityIndicatorView.transform.scaled(by: 0.9)

    objc_setAssociatedObject(
      self,
      &AssociationKeys.rightActivityIndicatorView,
      activityIndicatorView,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    return activityIndicatorView
  }

  private var ws_rightView: UIView? {
    get {
      return objc_getAssociatedObject(self, &AssociationKeys.rightView) as? UIView
    }
    set {
      objc_setAssociatedObject(self, &AssociationKeys.rightView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  func showRightLoadingIndicatorView(with color: UIColor = .lightGray) {
    if let rightView = rightView, rightView != ws_rightActivityIndicatorView.superview {
      ws_rightView = rightView
    }

    ws_rightActivityIndicatorView.color = color
    ws_rightActivityIndicatorView.startAnimating()

    let stackView = UIStackView(arrangedSubviews: [ws_rightActivityIndicatorView])
    stackView.frame = stackView.systemLayoutCompressedSize().toRect

    rightView = stackView
    layoutIfNeeded()
  }

  func hideRightLoadingIndicatorView() {
    if ws_rightActivityIndicatorView.isAnimating {
      ws_rightActivityIndicatorView.stopAnimating()
    }
    if rightView == ws_rightActivityIndicatorView.superview {
      rightView = ws_rightView
    }
    ws_rightView = nil
    layoutIfNeeded()
  }
}
