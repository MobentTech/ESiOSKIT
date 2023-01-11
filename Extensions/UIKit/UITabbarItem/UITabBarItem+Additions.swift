//
//  UITabBarItem+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UITabBarItem {

  private struct AssociatedKeys {
    static var selectedTitle = "tbi_selectedTitle"
    static var unselectedTitle = "tbi_unselectedTitle"
  }

  var selectedTitle: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.selectedTitle) as? String
    }
    set {
      if let newValue = newValue {
        objc_setAssociatedObject(self, &AssociatedKeys.selectedTitle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
    }
  }

  var unselectedTitle: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.unselectedTitle) as? String
    }
    set {
      if let newValue = newValue {
        objc_setAssociatedObject(self, &AssociatedKeys.unselectedTitle,
                                 newValue as String?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
    }
  }

  func setSelectedTitle(_ isSelected: Bool) {
    title = isSelected ? selectedTitle : unselectedTitle
  }

  convenience init(title: String?, selectedTitle: String?, image: UIImage?, selectedImage: UIImage?) {
    self.init(title: title, image: image, selectedImage: selectedImage)

    self.unselectedTitle = title
    self.selectedTitle = selectedTitle
  }
}
