//
//  URL+PDF.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension URL {

  /// Generates a preview of a PDF file with URL
  /// - Returns: UIImage, if document preview can be rendered, otherwise nil.
  func previewImageForPDF() -> UIImage? {
    guard
      let document = CGPDFDocument(self as CFURL),
      let page = document.page(at: 1) else { return .none }

    let drawRect = page.getBoxRect(.mediaBox)
    let renderer = UIGraphicsImageRenderer(size: drawRect.size)

    return renderer.image { ctx in
      UIColor.white.set()
      ctx.fill(drawRect)
      ctx.cgContext.translateBy(x: 0.0, y: drawRect.size.height)
      ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
      ctx.cgContext.drawPDFPage(page)
    }
  }
}
