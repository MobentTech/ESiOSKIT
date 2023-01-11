//
//  UIImageView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIImageView {

  var hidableImage: UIImage? {
    get { return image }
    set {
      image = newValue
      isHidden = (newValue == nil)
    }
  }

  func setImage(_ image: UIImage?, animated: Bool) {
    let setImageHandler = { self.image = image }

    if animated {
      UIView.transition(
        with: self, duration: 0.25,
        options: [.allowAnimatedContent, .transitionCrossDissolve],
        animations: setImageHandler
      )
    }
    else {
      setImageHandler()
    }
  }

  convenience init(image: UIImage, contentMode: UIView.ContentMode) {
    self.init(image: image)
    self.contentMode = contentMode
  }
}

// MARK: - Centered

public extension UIImageView {

  var centered: UIImageView {
    contentMode = .center
    return self
  }
}
