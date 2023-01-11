//
//  UIScreen+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIScreen {

  // Our designs are based on iPhone X.
  var referenceSize: CGSize {
    // swiftlint:disable line_length
    // https://developer.apple.com/library/archive/documentation/DeviceInformation/Reference/iOSDeviceCompatibility/Displays/Displays.html
    // swiftlint:enable line_length
    let size = CGSize(width: 375, height: 812)

    return orientation.isPortrait ? size : size.inverted
  }

  private var orientation: UIInterfaceOrientation {
    return UIApplication.shared.statusBarOrientation
  }

  var referenceSizeRatio: UIOffset {
    return UIOffset(
      horizontal: bounds.width / referenceSize.width,
      vertical: bounds.height / referenceSize.height
    )
  }
}
