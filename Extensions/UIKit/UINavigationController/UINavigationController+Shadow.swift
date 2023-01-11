//
//  UINavigationController+Shadow.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

private extension UINavigationController {

  private struct AssociationKeys {
    public static var scrollViewOffsetObservation = "ws_c_navigation_scrollViewOffsetObservation"
    public static var shadowImage = "ws_c_navigation_shadowImage"
    public static var didSetShadowImage = "ws_c_navigation_didSetShadowImage"
  }

  private var _scrollViewOffsetObservation: NSKeyValueObservation? {
    get {
      return objc_getAssociatedObject(self, &AssociationKeys.scrollViewOffsetObservation) as? NSKeyValueObservation
    }
    set {
      objc_setAssociatedObject(
        self, &AssociationKeys.scrollViewOffsetObservation, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }
  }

  private var _shadowImage: UIImage? {
    get {
      return objc_getAssociatedObject(self, &AssociationKeys.shadowImage) as? UIImage
    }
    set {
      objc_setAssociatedObject(self, &AssociationKeys.shadowImage, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  private var _didSetShadowImage: Bool {
    get {
      return (objc_getAssociatedObject(self, &AssociationKeys.didSetShadowImage) as? Bool).falseIfNil
    }
    set {
      objc_setAssociatedObject(
        self, &AssociationKeys.didSetShadowImage, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }
  }

  @objc private func handle_offsetChange(scrollView: UIScrollView) {
    if scrollView.contentOffset.y <= 0 && _didSetShadowImage {
      navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
      _didSetShadowImage = false
    }
    else if scrollView.contentOffset.y > 0 && !_didSetShadowImage {
      navigationBar.setShadowImage(_shadowImage, animated: true)
      _didSetShadowImage = true
    }
  }
}

public extension UINavigationController {

  func setShadowImage(_ image: UIImage = #imageLiteral(resourceName: "navigation-bar-shadow"), followingScrollView scrollView: UIScrollView) {
    _shadowImage = image
    _scrollViewOffsetObservation?.invalidate()

    _scrollViewOffsetObservation = scrollView.observe(\.contentOffset, options: [.initial, .new]) {
      [weak self] object, _ in

      self?.handle_offsetChange(scrollView: object)
    }
  }

  func hideShadowImageFollowingScrollView() {
    defer {
      navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
    }
    _shadowImage = nil
    _didSetShadowImage = false
    _scrollViewOffsetObservation?.invalidate()
  }
}
