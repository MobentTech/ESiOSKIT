//
//  UIView+Error.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIView {

  private struct AssociationKeys {
    public static var errorLabel = "ui_view_errorLabel"
  }

  var errorLabel: UILabel {
    if let errorLabel = objc_getAssociatedObject(self, &AssociationKeys.errorLabel)
      as? UILabel
    {
      return errorLabel
    }

    let errorLabel = UILabel()
    errorLabel.hidableAttributedText = .empty()
    errorLabel.cornerRadius = cornerRadius
    errorLabel.textAlignment = .center
    errorLabel.allowsDefaultTighteningForTruncation = true
    errorLabel.adjustsFontSizeToFitWidth = true
    errorLabel.minimumScaleFactor = 0.8
    errorLabel.numberOfLines = 0
    errorLabel.isUserInteractionEnabled = true
    addSubviewAndConstraintToEdges(errorLabel)

    objc_setAssociatedObject(
      self, &AssociationKeys.errorLabel, errorLabel,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )
    return errorLabel
  }

  func showError(_ text: NSAttributedString) {
    errorLabel.hidableAttributedText = text
  }

  func hideError() {
    errorLabel.isHidden = true
  }
}
