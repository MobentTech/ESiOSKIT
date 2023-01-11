//
//  UIButton+Specials.swift
//  SportsBetting
//
//  Created by Emre Ciftci on 14.03.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIButton {

  class func companyIcon() -> UIButton {
    let button = UIButton(title: .empty(), image: #imageLiteral(resourceName: "img-nav-cci-logo")) {}
    button.setContentCompressionResistancePriority(.defaultHigh - 1, for: .horizontal)
    button.isUserInteractionEnabled = false
    return button
  }

  class func logout(action: @escaping VoidCallback) -> UIButton {
    let button = UIButton(title: .empty(), image: #imageLiteral(resourceName: "img-nav-logout"), action: action)
    button.imageView?.contentMode = .scaleAspectFit
    return button
  }

  class func back(action: @escaping VoidCallback) -> UIButton {
    return UIButton(title: "tab.training".localized.attributed, image: #imageLiteral(resourceName: "ico-arrow-left"), action: action)
  }
}
