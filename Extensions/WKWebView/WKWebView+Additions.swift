//
//  WKWebView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 22.03.2021.
//

import WebKit

public extension WKWebView {

  func clearContent() {
    loadHTMLString(.empty, baseURL: .none)
  }
}
