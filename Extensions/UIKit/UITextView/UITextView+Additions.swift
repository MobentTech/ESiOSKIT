//
//  UITextView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UITextView {

  var hidableText: String? {
    get { return text }
    set {
      text = newValue
      isHidden = newValue.emptyIfNil.isEmpty
    }
  }

  func resize(to maxHeight: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    frame.size = newSize()
    isScrollEnabled = contentSize.height >= maxHeight
  }

  private func newSize(for height: CGFloat = .max) -> CGSize {
    let width = frame.size.width
    let size = sizeThatFits(CGSize(width: width, height: height))
    return CGSize(width: max(size.width, width), height: size.height)
  }
}
