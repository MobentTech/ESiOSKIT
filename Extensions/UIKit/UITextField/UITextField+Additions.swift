//
//  UITextField+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UITextField {

  func clear() {
    text = .empty
    attributedText = NSAttributedString(string: .empty)
  }

  /// Moves the caret to the correct position by removing the trailing whitespace
  func fixCaretPosition() {
    let beginning = beginningOfDocument
    selectedTextRange = textRange(from: beginning, to: beginning)
    let end = endOfDocument
    selectedTextRange = textRange(from: end, to: end)
  }

  func canReplace(string: String, in range: NSRange, withMask mask: String) -> Bool {
    if string.isBackspaceCharacter && mask.count >= range.location {
      text = mask
      return false
    }
    return range.location >= mask.count
  }

  func canReplace(string: String, in range: NSRange, withSeparator separator: String) -> Bool {
    guard string.ns.contains(separator) else { return true }

    let currentText = text.emptyIfNil.ns
    // If new separator index smaller than or equal to old separator index
    if currentText.range(of: separator).location > range.location {
      // Remove right side of the separator
      let newLocation = range.location
      let newRange = NSRange(location: newLocation, length: currentText.length - newLocation)
      text = currentText.replacingCharacters(in: newRange, with: string)
    }
    return false
  }

  func canReplace(mask: AutoMask, in range: NSRange, string: String) -> Bool {

    let currentText: NSString = text.emptyIfNil.ns

    let newText = currentText.replacingCharacters(in: range, with: string)
    let formattedString = mask.mask(string: newText)

    guard let finalText = formattedString?.ns else { return false }

    if finalText == currentText && range.location < currentText.length && range.location > .zero {
      return canReplace(mask: mask, in: NSRange(location: range.location - 1, length: range.length + 1), string: string)
    }

    if finalText == currentText { return true }
    text = finalText as String
    if range.location >= currentText.length { return false }

    var cursorLocation: Int = .zero

    if range.location > finalText.length {
      cursorLocation = finalText.length
    }
    else if currentText.length > finalText.length {
      cursorLocation = range.location
    }
    else {
      cursorLocation = range.location + 1
    }

    if
      let startPosition = position(from: beginningOfDocument, offset: cursorLocation),
      let endPosition = position(from: startPosition, offset: .zero) {

      selectedTextRange = textRange(from: startPosition, to: endPosition)
    }

    return false
  }

  @discardableResult
  func becomeFirstResponder(onlyIfEmpty: Bool) -> Bool {
    if text.emptyIfNil.isNotEmpty && onlyIfEmpty {
      return false
    }
    return becomeFirstResponder()
  }
}

public extension UITextContentType {

  static var invalid: UITextContentType {
    if #available(iOS 12.0, *) {
      return .oneTimeCode
    } else {
      return .init(rawValue: .empty)
    }
  }
}
