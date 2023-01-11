//
//  UITableViewCell+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UITableViewCell {

  func setIndent(level: Int, width: CGFloat) {
    indentationLevel = level
    indentationWidth = width
  }

  func disableSuperviewPreservingLayoutMargins() {
    preservesSuperviewLayoutMargins = false
    contentView.preservesSuperviewLayoutMargins = false
  }

//  override func makeAllCornersRounded(_ radius: CGFloat) {
//    backgroundColor = .clear
//    contentView.makeAllCornersRounded(radius)
//  }
//
//  override func makeTopCornersRounded(_ radius: CGFloat) {
//    backgroundColor = .clear
//    contentView.makeTopCornersRounded(radius)
//  }
//
//  override func makeBottomCornersRounded(_ radius: CGFloat) {
//    backgroundColor = .clear
//    contentView.makeBottomCornersRounded(radius)
//  }
//
//  override func makeLeftCornersRounded(_ radius: CGFloat) {
//    backgroundColor = .clear
//    contentView.makeLeftCornersRounded(radius)
//  }
//
//  override func makeRightCornersRounded(_ radius: CGFloat) {
//    backgroundColor = .clear
//    contentView.makeRightCornersRounded(radius)
//  }
}
