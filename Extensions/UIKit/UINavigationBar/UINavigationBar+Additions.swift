//
//  UINavigationBar+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UINavigationBar {

  func setShadowImage(_ image: UIImage?, animated: Bool) {
    shadowImage = image
    if animated {
      UIView.animate(withDuration: 0.15, animations: layoutIfNeeded)
    }
  }
}

// MARK: - UINavigationBar + Appearance

public extension UINavigationBar {

  func setColors(background: UIColor, text: UIColor, hideShadow: Bool = false) {
    tintColor = text
    isTranslucent = false
    backgroundColor = background
    barTintColor = text
    setBackgroundImage(UIImage(), for: .default)
    shadowImage = UIImage()

    if #available(iOS 13.0, *) {
      let appearance = UINavigationBarAppearance()
      hideShadow ? appearance.configureWithTransparentBackground() : appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = background
      appearance.titleTextAttributes = [.foregroundColor: text]
      appearance.largeTitleTextAttributes = [.foregroundColor: text]

      standardAppearance = appearance
      scrollEdgeAppearance = appearance
    }
    else {
      titleTextAttributes = [.foregroundColor: text]
    }
  }
}
