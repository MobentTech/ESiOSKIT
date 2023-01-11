//
//  UIImage+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UIImage {

  convenience init?(contentsOfFile url: URL) {
    guard let data = try? Data(contentsOf: url) else { return nil }
    self.init(data: data, scale: UIScreen.main.scale)
  }

  convenience init?(color: UIColor, size: CGSize) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, color.alpha == 1, 0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }

  convenience init?(color: UIColor) {
    self.init(color: color, size: CGSize(size: 1))
  }

  @available(*, deprecated)
  convenience init?(hexColor: String, size: CGSize) {
    self.init(color: UIColor(hex: hexColor), size: size)
  }

  @available(*, deprecated)
  convenience init?(hexColor: String) {
    self.init(hexColor: hexColor, size: CGSize(size: 1))
  }

  func resized(to newSize: CGSize) -> UIImage {
    let horizontalRatio = newSize.width / size.width
    let verticalRatio = newSize.height / size.height

    let ratio = max(horizontalRatio, verticalRatio)
    let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)

    return UIGraphicsImageRenderer(size: newSize).image { _ in
      draw(in: newSize.toRect)
    }
  }

  func resized(toWidth width: CGFloat) -> UIImage {
    return resized(to: CGSize(width: width, height: width / (size.width / size.height)))
  }

  var base64: String {
    return jpeg(quality: 0.5).base64EncodedString()
  }

  var oriented: UIImage {
    if imageOrientation == .up {
      return self
    }
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    defer { UIGraphicsEndImageContext() }

    draw(in: size.toRect)
    return UIGraphicsGetImageFromCurrentImageContext().ifNil(self)
  }
}

public extension UIImage {

  func jpeg(quality: CGFloat = 1.0) -> Data {
    return jpegData(compressionQuality: quality).ifNil(.empty)
  }

  func png() -> Data {
    return pngData().ifNil(.empty)
  }
}
