//
//  NSTextAttachment+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension NSTextAttachment {

  class func withImage(image: UIImage?) -> NSTextAttachment {
    let attachment = NSTextAttachment()

    if let image = image {
      attachment.image = image
      attachment.bounds = image.size.toRect
    }
    return attachment
  }

  var attributed: NSAttributedString {
    return NSAttributedString(attachment: self)
  }
}
