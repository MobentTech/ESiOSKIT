//
//  UINavigationController+NavigationBar.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

private final class NavigationBarTraits {

  public var backgroundImage: UIImage?
  public var backIndicatorImage: UIImage?
  public var backIndicatorTransitionMaskImage: UIImage?
  public var shadowImage: UIImage?

  public var isTranslucent: Bool
  public var tintColor: UIColor?

  public var largeTitleTextAttributes: [NSAttributedString.Key: Any]?
  public var titleTextAttributes: [NSAttributedString.Key: Any]?

  public func apply(to navigationBar: UINavigationBar) {
    navigationBar.backIndicatorImage = backIndicatorImage
    navigationBar.backIndicatorTransitionMaskImage = backIndicatorTransitionMaskImage

    navigationBar.shadowImage = shadowImage
    navigationBar.isTranslucent = isTranslucent
    navigationBar.tintColor = tintColor

    navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
    navigationBar.titleTextAttributes = titleTextAttributes

    navigationBar.setBackgroundImage(backgroundImage, for: .default)
  }

  public init(navigationBar: UINavigationBar) {
    backIndicatorImage = navigationBar.backIndicatorImage
    backIndicatorTransitionMaskImage = navigationBar.backIndicatorTransitionMaskImage

    backgroundImage = navigationBar.backgroundImage(for: .default)

    shadowImage = navigationBar.shadowImage
    isTranslucent = navigationBar.isTranslucent
    tintColor = navigationBar.tintColor

    largeTitleTextAttributes = navigationBar.largeTitleTextAttributes
    titleTextAttributes = navigationBar.titleTextAttributes
  }
}

public extension UINavigationController {

  private struct AssociationKeys {
    public static var navigationBarTraits = "ws_nc_navigationBarTraits"
  }

  private var navigationBarTraits: NavigationBarTraits? {
    get {
      return objc_getAssociatedObject(self, &AssociationKeys.navigationBarTraits) as? NavigationBarTraits
    }
    set {
      objc_setAssociatedObject(self, &AssociationKeys.navigationBarTraits, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  func configureBar(block: Callback<UINavigationBar>) {
    navigationBarTraits = NavigationBarTraits(navigationBar: navigationBar)
    block(navigationBar)
  }

  func resetBar() {
    navigationBarTraits?.apply(to: navigationBar)
    navigationBarTraits = .none
  }
}
