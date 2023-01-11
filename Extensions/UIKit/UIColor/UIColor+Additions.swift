//
//  UIColor+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIColor {

  /// Takes values between 0 and 1. The values can exceed the bounds.
  func darker(by percentage: Double) -> UIColor {
    return withBrightness(factor: CGFloat(1.0 - percentage))
  }

  /// Takes values between 0 and 1. The values can exceed the bounds.
  func lighter(by percentage: Double) -> UIColor {
    return withBrightness(factor: CGFloat(1.0 + percentage))
  }

  private func withBrightness(factor: CGFloat) -> UIColor {
    var hue: CGFloat = 0.0
    var saturation: CGFloat = 0.0
    var brightness: CGFloat = 0.0
    var alpha: CGFloat = 0.0

    if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
      return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
    }
    else {
      return self
    }
  }

  var alpha: CGFloat {
    var alpha: CGFloat = 0
    getRed(nil, green: nil, blue: nil, alpha: &alpha)
    return alpha
  }
}

// MARK: - HEX

public extension UIColor {

  convenience init(hex: String) {
    var hex = hex
    var alpha: Float = 100
    let hexLength = hex.count
    if !(hexLength == 7 || hexLength == 9) {
      // A hex must be either 7 or 9 characters (#RRGGBBAA)
      print("improper call to 'colorFromHex', hex length must be 7 or 9 chars (#GGRRBBAA)")
      self.init(white: 0, alpha: 1)
      return
    }

    if hexLength == 9 {
      // Note: this uses String subscripts as given below
      alpha = hex[7...8].float
      hex = hex[0...6]
    }

    // Establishing the rgb color
    var rgb: UInt32 = 0
    let s: Scanner = Scanner(string: hex)
    // Setting the scan location to ignore the leading `#`
    s.scanLocation = 1
    // Scanning the int into the rgb colors
    s.scanHexInt32(&rgb)

    // Creating the UIColor from hex int
    self.init(
      red: round(CGFloat((rgb & 0xFF0000) >> 16) / 255.0 * 1000) / 1000,
      green: round(CGFloat((rgb & 0x00FF00) >> 8) / 255.0 * 1000) / 1000,
      blue: round(CGFloat(rgb & 0x0000FF) / 255.0 * 1000) / 1000,
      alpha: round(CGFloat(alpha / 100) * 1000) / 1000
    )
  }
}
