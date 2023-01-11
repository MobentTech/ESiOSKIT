//
//  UIButton+ActivityIndicator.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIButton {

  private struct AssociationKeys {
    public static var activityIndicatorView = "ec_button_activityIndicatorView"
  }

  override var activityIndicatorView: UIActivityIndicatorView {
    if let activityIndicatorView = objc_getAssociatedObject(
      self, &AssociationKeys.activityIndicatorView) as? UIActivityIndicatorView
    {
      return activityIndicatorView
    }

    let activityIndicatorView = UIActivityIndicatorView.create(style: .white)
    activityIndicatorView.hidesWhenStopped = true
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false

    addSubview(activityIndicatorView)

    NSLayoutConstraint.activate(
      [
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
      ]
    )

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|->=8@999-[activityIndicatorView]-8@999-|",
      options: [],
      metrics: [:],
      views: ["activityIndicatorView": activityIndicatorView]))

    objc_setAssociatedObject(self, &AssociationKeys.activityIndicatorView,
                             activityIndicatorView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    return activityIndicatorView
  }

  override func startLoadingIndicatorView() {
    guard activityIndicatorView.isAnimating == false else { return }

    isEnabled = false
    super.startLoadingIndicatorView()
  }

  override func stopLoadingIndicatorView() {
    guard activityIndicatorView.isAnimating else { return }

    isEnabled = true
    super.stopLoadingIndicatorView()
  }
}
