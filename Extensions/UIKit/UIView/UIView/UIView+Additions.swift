//
//  UIView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIView {

  convenience init(frame: CGRect, background: UIColor) {
    self.init(frame: frame)
    self.backgroundColor = background
  }

  convenience init(background: UIColor) {
    self.init(frame: CGRect.zero, background: background)
  }

  func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }

  func removeAllSubviews() {
    subviews.forEach { $0.removeFromSuperview() }
  }

  func removeSubview(at index: Int) {
    subviews[index].removeFromSuperview()
  }

  var hasVisibleSubviews: Bool {
    return subviews.contains { $0.isHidden == false }
  }

  var areAllSubviewsHidden: Bool {
    return hasVisibleSubviews == false
  }

  func hideAllSubviews() {
    subviews.forEach { $0.isHidden = true }
  }

  func removeAllGestureRecognizers() {
    for gestureRecognizer in gestureRecognizers.ifNil([]) {
      removeGestureRecognizer(gestureRecognizer)
    }
  }

  func subviews<T>(ofType type: T.Type) -> [T] {
    var result = [T]()
    var stack = Array(subviews.reversed())

    while !stack.isEmpty {
      let view = stack.removeLast()
      stack.append(contentsOf: view.subviews.reversed())

      if let aView = view as? T {
        result.append(aView)
      }
    }
    return result
  }

  func transformToIdentity() {
    transform = .identity
  }

  func rotateCounterClockwise() {
    transform = CGAffineTransform(rotationAngle: 180 * .pi)
    transform = CGAffineTransform(rotationAngle: -.pi)
  }

  // Animation helpers

  class func animate(withDuration duration: TimeInterval, damping: CGFloat, velocity: CGFloat,
                     options: UIView.AnimationOptions, animations: @escaping () -> Void)
  {
    animate(withDuration: duration, delay: 0.0,
            usingSpringWithDamping: damping, initialSpringVelocity: velocity,
            options: options, animations: animations, completion: nil)
  }

  class func animate(withDuration duration: TimeInterval, options: UIView.AnimationOptions,
                     animations: @escaping () -> Void, completion: ((Bool) -> Void)?)
  {
    animate(withDuration: duration, delay: 0.0, options: options,
            animations: animations, completion: completion)
  }

  class func animate(withDuration duration: TimeInterval, options: UIView.AnimationOptions,
                     animations: @escaping () -> Void)
  {
    animate(withDuration: duration, options: options, animations: animations, completion: nil)
  }

  func setHidden(_ isHidden: Bool, animated: Bool, completion: Callback<Bool>? = nil) {
    guard self.isHidden != isHidden else { return }

    if animated {
      UIView.transition(with: self, duration: 0.25,
                        options: .transitionCrossDissolve,
                        animations: { self.isHidden = isHidden }, completion: completion)
    }
    else {
      self.isHidden = isHidden
      completion?(true)
    }
  }

  func setAlpha(_ alpha: CGFloat, animated: Bool) {
    guard self.alpha != alpha else { return }

    if animated {
      UIView.transition(with: self, duration: 0.25,
                        options: .transitionCrossDissolve,
                        animations: { self.alpha = alpha }, completion: nil)
    }
    else {
      self.alpha = alpha
    }
  }

  func addSubviewAndConstraintToEdges(_ view: UIView) {
    addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: topAnchor),
      view.bottomAnchor.constraint(equalTo: bottomAnchor),

      view.leadingAnchor.constraint(equalTo: leadingAnchor),
      view.trailingAnchor.constraint(equalTo: trailingAnchor),

      view.heightAnchor.constraint(equalTo: heightAnchor),
      view.widthAnchor.constraint(equalTo: widthAnchor)
    ])
  }

  func addSubviewAndConstraintToSafeAreaEdges(_ view: UIView) {
    addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

      view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
    ])
  }

  func makeCornersRounded(_ radius: CGFloat, corners: CACornerMask) {
    layer.masksToBounds = true
    layer.cornerRadius = radius
    layer.maskedCorners = corners
  }

  @objc func makeAllCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: CALayer.allCorners)
  }

  @objc func makeTopCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: CALayer.topCorners)
  }

  @objc func makeBottomCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: CALayer.bottomCorners)
  }

  @objc func makeLeftCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: CALayer.leftCorners)
  }

  @objc func makeRightCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: CALayer.rightCorners)
  }

  class func empty() -> UIView {
    return UIView(frame: .zero, background: .clear)
  }

  func addAnimation(transitionType: CATransitionType, for duration: CFTimeInterval) {
    layer.removeAnimation(forKey: transitionType.rawValue)

    let animation = CATransition()
    animation.type = transitionType
    animation.duration = duration
    layer.add(animation, forKey: transitionType.rawValue)
  }
}

// MARK: - Layout

public extension UIView {

  var isAttachedToWindow: Bool {
    return window != .none
  }

  var topAnchorConstraint: NSLayoutConstraint? {

    return superview?.constraints.first { constraint in
      (constraint.firstView == self || constraint.secondView == self) &&
        (constraint.firstAnchor == topAnchor || constraint.secondAnchor == topAnchor)
    }
  }

  func systemLayoutCompressedSize() -> CGSize {
    return systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
  }

  func setAccessibility(available: Bool) {
    isAccessibilityElement = available
    accessibilityLabel = available ? "\(type(of: self).classForCoder())" : .none
  }
}
