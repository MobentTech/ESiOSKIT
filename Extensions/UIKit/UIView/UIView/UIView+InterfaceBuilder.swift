//
//  UIView+InterfaceBuilder.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIView {

  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }

  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
      guard let borderColor = layer.borderColor else { return nil }
      return UIColor(cgColor: borderColor)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }

  @IBInspectable var shadowColor: UIColor? {
    get {
      let color = UIColor(cgColor: layer.shadowColor!)
      return color
    }
    set {
      layer.shadowColor = newValue?.cgColor
    }
  }

  @IBInspectable var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.masksToBounds = false
      layer.shadowOffset = newValue
    }
  }

  @IBInspectable var shadowOpacity: CGFloat {
    get {
      return CGFloat(layer.shadowOpacity)
    }
    set {
      layer.masksToBounds = false
      layer.shadowOpacity = Float(newValue)
    }
  }

  @IBInspectable var shadowRadius: CGFloat {
    get {
      return layer.shadowRadius
    }
    set {
      layer.masksToBounds = false
      layer.shadowRadius = newValue
    }
  }
}
