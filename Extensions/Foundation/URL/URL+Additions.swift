//
//  URL+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

 
import Foundation
import UIKit


// MARK: - URLCache

public extension URLCache {

  static var empty: URLCache {
    return URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
  }
}

// MARK: - URL

public extension URL {

  static let localhost = URL(staticString: "http://localhost")

  init(staticString string: StaticString) {
    guard let url = URL(string: "\(string)") else {
      preconditionFailure("Invalid static URL string: \(string)")
    }
    self = url
  }

  var request: URLRequest {
    return URLRequest(url: self)
  }

  func open() {
    UIApplication.shared.open(self)
  }

  func starts(with url: URL) -> Bool {
    return absoluteString.starts(with: url.absoluteString)
  }
}
