//
//  UINavigationController+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

 
import UIKit

public extension UINavigationController {

  var rootViewController: UIViewController! {
    return viewControllers.first
  }

  func setBackgroundColor(_ color: UIColor) {
    view.backgroundColor = color
    navigationBar.barTintColor = color
    navigationBar.setBackgroundImage(UIImage(color: color), for: .default)
  }

  private func doAfterAnimatingTransition(animated: Bool, completion: @escaping VoidCallback) {
    guard let coordinator = transitionCoordinator, animated else {
      completion()
      return
    }

    coordinator.animate(alongsideTransition: nil, completion: { _ in
      completion()
    })
  }

  func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping VoidCallback) {
    pushViewController(viewController, animated: animated)
    doAfterAnimatingTransition(animated: animated, completion: completion)
  }

  func popViewController(animated: Bool, completion: @escaping VoidCallback) {
    popViewController(animated: animated)
    doAfterAnimatingTransition(animated: animated, completion: completion)
  }

  func popToRootViewController(animated: Bool, completion: @escaping VoidCallback) {
    popToRootViewController(animated: animated)
    doAfterAnimatingTransition(animated: animated, completion: completion)
  }
}
