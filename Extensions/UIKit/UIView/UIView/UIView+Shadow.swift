//
//  UIView+Shadow.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIView {

  struct Shadow {

    public enum Position: Int {
      case top = -1
      case bottom = 1
    }

    public var color: UIColor
    public var opacity: Float
    public var radius: CGFloat
    public var offset: CGFloat
    public var position: Position

    public static let top = Shadow(
      color: UIColor.black,
      opacity: 0.15, radius: 6.0, offset: 6, position: .top)

    public static let bottom = Shadow(
      color: UIColor.black,
      opacity: 0.15, radius: 6.0, offset: 6, position: .bottom)
  }

  func addShadow(_ shadow: Shadow, animated: Bool = false) {
    let position = shadow.offset * CGFloat(shadow.position.rawValue)

    layer.shadowColor = shadow.color.cgColor
    layer.shadowOffset = CGSize(width: 0, height: position)
    layer.shadowRadius = shadow.radius
    layer.shadowOpacity = shadow.opacity

    if animated {
      let animation = CABasicAnimation(keyPath: "shadowOpacity")

      animation.duration = 0.25
      animation.fromValue = 0.0
      animation.toValue = shadow.opacity

      layer.add(animation, forKey: "addShadowAnimation")
    }
  }
}
