//
//  AttributedString+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension NSMutableAttributedString {

  func append(_ attrString: NSAttributedString?) {
    if let attrString = attrString {
      append(attrString)
    }
  }

  func prepend(_ attrString: NSAttributedString?) {
    if let attrString = attrString {
      insert(attrString, at: 0)
    }
  }

  func prepending(_ attrString: NSAttributedString?) -> NSMutableAttributedString {
    if let attrString = attrString {
      prepend(attrString)
    }
    return self
  }

  func appending(_ attrString: NSAttributedString?) -> NSMutableAttributedString {
    if let attrString = attrString {
      append(attrString)
    }
    return self
  }

  convenience init(attributedString attrStr: NSAttributedString, attachment: NSTextAttachment) {
    let string = NSMutableAttributedString(attributedString: attachment.attributed)
    string.append(attrStr)

    self.init(attributedString: string)
  }

  var fullRange: NSRange {
    return NSRange(location: 0, length: string.count)
  }
}

public extension NSAttributedString {

  class func empty() -> NSAttributedString {
    return NSAttributedString()
  }

  var isEmpty: Bool {
    return length.isZero
  }

  var mutable: NSMutableAttributedString {
    return NSMutableAttributedString(attributedString: self)
  }

  func ifEmpty(_ default: @autoclosure () -> NSAttributedString) -> NSAttributedString {
    return isEmpty ? `default`() : self
  }

  static func icon(image: UIImage, origin: CGPoint = .zero) -> NSAttributedString {
    let attachment = NSTextAttachment.withImage(image: image)

    attachment.bounds.origin = origin
    attachment.bounds.size = image.size

    return NSAttributedString(attachment: attachment)
  }
}

// MARK: - Optionals

public extension Optional where Wrapped == NSAttributedString {

  var emptyIfNil: Wrapped {
    return ifNil(.empty())
  }
}
