//
//  UIView+Separator.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIView {

  private struct AssociationKeys {
    public static var separatorView = "ws_v_separatorView"
  }

  @objc func showSeparator(color: UIColor, animated: Bool = false) {
    separatorView.backgroundColor = color
    separatorView.setHidden(false, animated: animated)
  }

  @objc func hideSeparator(animated: Bool = false) {
    separatorView.setHidden(true, animated: animated)
  }

  private var separatorView: UIView {
    if let separatorView = objc_getAssociatedObject(self, &AssociationKeys.separatorView) as? UIView {
      return separatorView
    }

    let separatorView = UIView()
    separatorView.translatesAutoresizingMaskIntoConstraints = false
    separatorView.isHidden = true

    addSubview(separatorView)

    NSLayoutConstraint.activate([
      separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),

      separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

      separatorView.heightAnchor.constraint(equalToConstant: 0.9)
    ])

    objc_setAssociatedObject(self, &AssociationKeys.separatorView, separatorView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    return separatorView
  }
}
