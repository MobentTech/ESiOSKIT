//
//  UIButton+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIButton {

  func setRightToLeft() {
    transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
  }

  func setLeftToRight() {
    transform = CGAffineTransform.identity
    titleLabel?.transform = CGAffineTransform.identity
    imageView?.transform = CGAffineTransform.identity
  }

  func setHidableTitle(title: String, for state: UIControl.State) {
    setTitle(title, for: state)
    isHidden = title.isEmpty
  }

  func setHidableAttributedTitle(title: NSAttributedString, for state: UIControl.State) {
    setAttributedTitle(title, for: state)
    isHidden = title.string.isEmpty
  }

  func setEnabled(_ isEnabled: Bool, animated: Bool, completion: Callback<Bool>? = .none) {
    if self.isEnabled == isEnabled { return }
    setState(with: { self.isEnabled = isEnabled }, animated: animated, completion: completion)
  }

  func setSelected(_ isSelected: Bool, animated: Bool, completion: Callback<Bool>? = .none) {
    if self.isSelected == isSelected { return }
    setState(with: { self.isSelected = isSelected }, animated: animated, completion: completion)
  }

  private func setState(with block: @escaping VoidCallback, animated: Bool, completion: Callback<Bool>?) {
    if animated {
      UIView.transition(
        with: self, duration: 0.15,
        options: UIView.AnimationOptions.transitionCrossDissolve,
        animations: block, completion: completion)
    }
    else {
      block(); completion?(true)
    }
  }

  convenience init(title: NSAttributedString, image: UIImage?, action: @escaping VoidCallback) {
    self.init(type: .system)

    self.setImage(image, for: .normal)
    self.setAttributedTitle(title, for: .normal)

    self.touchUpInsideAction = { _ in action() }
  }

  convenience init(title: NSAttributedString, backgroundImage: UIImage?, action: @escaping VoidCallback) {
    self.init(type: .system)

    self.setBackgroundImage(backgroundImage, for: .normal)
    self.setAttributedTitle(title, for: .normal)

    self.touchUpInsideAction = { _ in action() }
  }
}
