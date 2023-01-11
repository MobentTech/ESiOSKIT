//
//  UIAlertController+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

 
import UIKit

public extension UIAlertController {

  class func actionSheet(title: String? = .none, message: String? = .none) -> UIAlertController {
    return .init(title: title, message: message, preferredStyle: .actionSheet)
  }

  class func alert(title: String? = .none, message: String? = .none) -> UIAlertController {
    return .init(title: title, message: message, preferredStyle: .alert)
  }

  @discardableResult final func addActions(_ actions: UIAlertAction...) -> Self {
    actions.forEach { addAction($0) }
    return self
  }

  final func show(onto view: UIViewController, animated: Bool, completion: VoidCallback? = .none) {
    view.present(self, animated: animated, completion: completion)
  }
}
