//
//  UIViewController+PresentationStyle.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIModalPresentationStyle {

  mutating func switchToFullScreenIfAutomatic() {
    guard #available(iOS 13.0, *) else { return }

    if inside(styles: [.automatic, .pageSheet]) {
      self = .fullScreen
    }
  }

  private func inside(styles: [UIModalPresentationStyle]) -> Bool {
    return styles.contains(self)
  }
}
