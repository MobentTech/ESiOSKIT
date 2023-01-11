//
//  UILabel+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UILabel {

  var hidableText: String? {
    get { return text }
    set {
      text = newValue
      isHidden = newValue.emptyIfNil.isEmpty
    }
  }

  var hidableAttributedText: NSAttributedString? {
    get { return attributedText }
    set {
      attributedText = newValue
      isHidden = newValue.ifNil(.empty()).string.isEmpty
    }
  }

  var isEmpty: Bool {
    return text.emptyIfNil.isEmpty && attributedText.ifNil(.empty()).isEmpty
  }

  func setText(_ text: String?, animated: Bool) {
    if animated {
      layer.removeAllAnimations()
      addAnimation(transitionType: .fade, for: 0.3)
    }
    self.text = text
  }

//  func setText(_ text: String?, gradient: (start: UIColor, end: UIColor)) {
//    self.attributedText = text?.gradientText(font: font, colors: gradient)
//  }
}
