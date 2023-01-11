//
//  UIActivityIndicatorView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIActivityIndicatorView {

  class func create(style: UIActivityIndicatorView.Style) -> UIActivityIndicatorView {
    let view = UIActivityIndicatorView(style: style)
    view.color = .white
    return view
  }
}
