//
//  UIStackView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIStackView {

  func addArrangedSubview(_ view: UIView?) {
    if let view = view {
      addArrangedSubview(view)
    }
  }

  func addArrangedSubviews(_ views: UIView...) {
    addArrangedSubviews(views)
  }

  func addArrangedSubviews(_ views: [UIView]) {
    views.forEach { addArrangedSubview($0) }
  }

  func setArrangedSubviews(_ views: [UIView]) {
    removeAllSubviews()
    addArrangedSubviews(views)
  }

  func removeArrangedSubview(_ index: Int) {
    arrangedSubviews[index].removeFromSuperview()
  }

  func replaceSubview(at index: Int, with view: UIView) {
    removeArrangedSubview(index)
    insertArrangedSubview(view, at: index)
  }

  func insertSubview(_ controller: UIViewController, at index: Int, animated: Bool) {
    controller.view.isHidden = true
    insertArrangedSubview(controller.view, at: index)
    controller.view.setHidden(false, animated: animated)
  }
}

public extension UIStackView {

  convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, views: UIView...) {
    self.init(axis: axis, spacing: spacing, views: views)
  }

  convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, views: [UIView]) {
    self.init(frame: .zero)

    self.axis = axis
    self.spacing = spacing
    self.addArrangedSubviews(views)
  }
}
