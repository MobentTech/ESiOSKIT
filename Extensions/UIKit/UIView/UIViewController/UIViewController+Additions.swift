//
//  UIViewController+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

 
import UIKit

public extension UIViewController {

  var navigationBar: UINavigationBar? {
    return navigationController?.navigationBar
  }

  class var topMostViewController: UIViewController? {
    var rootViewController: UIViewController?
    if let windowRootViewController = UIApplication.shared.keyWindow?.rootViewController {
      rootViewController = windowRootViewController
    }
    return topMostViewController(of: rootViewController)
  }

  class func topMostViewController(of viewController: UIViewController?) -> UIViewController? {
    // presented view controller
    if let presentedViewController = viewController?.presentedViewController,
      !(presentedViewController is UISearchController) {
      return topMostViewController(of: presentedViewController)
    }

    // UITabBarController
    if let tabBarController = viewController as? UITabBarController,
      let selectedViewController = tabBarController.selectedViewController {
      return topMostViewController(of: selectedViewController)
    }

    // UINavigationController
    if let navigationController = viewController as? UINavigationController,
      let visibleViewController = navigationController.visibleViewController {
      return topMostViewController(of: visibleViewController)
    }

    // UIPageController
    if let pageViewController = viewController as? UIPageViewController,
      pageViewController.viewControllers?.count == 1 {
      return topMostViewController(of: pageViewController.viewControllers?.first)
    }

    // Child view controller
    for subview in viewController?.view?.subviews ?? [] {
      if let childViewController = subview.next as? UIViewController {
        return topMostViewController(of: childViewController)
      }
    }

    return viewController
  }

  class var topMostNavigationController: UINavigationController? {
    let topMostViewController = self.topMostViewController

    if let navigationController = topMostViewController as? UINavigationController {
      return navigationController
    }
    else {
      return topMostViewController?.navigationController
    }
  }

  func dismissToRootViewController(animated: Bool, completion: VoidCallback? = .none) {
    view.window?.rootViewController?.dismiss(animated: animated, completion: completion)
  }

  func dismissIfAlertController(animated: Bool, completion: VoidCallback? = .none) {
    if let alertController = self as? UIAlertController {
      alertController.dismiss(animated: animated, completion: completion)
    }
    else {
      completion?()
    }
  }

  private func setDismissBarButtonItem(tintColor: UIColor, action: @escaping VoidCallback) {

    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "img-close-thin"), for: .normal)
    button.tintColor = tintColor
    button.contentEdgeInsets = UIEdgeInsets(edges: 2.5)

    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.widthAnchor.constraint(equalToConstant: 32.5),
      button.heightAnchor.constraint(equalToConstant: 32.5)
    ])

    button.touchUpInsideAction = { _ in action() }
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
  }

  func setDismissBarButtonItem(tintColor: UIColor = .white, completion: VoidCallback? = .none) {
    setDismissBarButtonItem(tintColor: tintColor) { [unowned self] in
      self.dismiss(animated: true, completion: completion)
    }
  }

  func setTCBarButtonItem(tintColor: UIColor = .white,
                          _ action: @escaping Callback<UIButton>)
  {
    let tcButton = UIButton(type: .system)

    tcButton.setTitle("TermsAndConditions".localized, for: .normal)
    tcButton.setTitleColor(tintColor, for: .normal)
    tcButton.setTitleColor(.darkGray, for: .disabled)

    tcButton.translatesAutoresizingMaskIntoConstraints = false
    tcButton.touchUpInsideAction = action

    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: tcButton)
  }

  func setCompanyIconTitle(_ action: Callback<UIButton>? = .none) {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "img-nav-cci-logo"), for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(edges: 2.5)
    button.translatesAutoresizingMaskIntoConstraints = false

    button.touchUpInsideAction = action
    navigationItem.titleView = button
  }

  func setBackButton(action: @escaping VoidCallback) {
    navigationItem.setBackButton(action: action)
  }

  func scrollToTop(animated: Bool) {
    view
      .subviews(ofType: UIScrollView.self)
      .first(where: { $0.direction == .vertical && $0.scrollsToTop })?
      .scrollToTop(animated: animated)
  }

  func add(child controller: UIViewController) {
    add(child: controller, to: view)
  }

  func add(child controller: UIViewController, to view: UIView) {
    addChild(controller)
    view.addSubview(controller.view)
    controller.didMove(toParent: self)
  }

  func remove() {
    willMove(toParent: .none)
    view.removeFromSuperview()
    removeFromParent()
  }
}

// MARK: - CAEmitterLayer

public extension UIViewController {

  func setConfetti(with image: UIImage) {
    let layer = CAEmitterLayer()
    layer.emitterShape = .line
    layer.emitterSize = CGSize(width: view.frame.size.width, height: 1)
    layer.emitterPosition = CGPoint(x: view.center.x, y: -96)

    let colors: [UIColor] = [
      .red,
      .green,
      .white,
      .gray
    ]
    layer.emitterCells = colors.map(confetti)

    view.layer.insertSublayer(layer, at: 0)
  }

  func endEmitter() {
    guard
      let layer = view.layer.sublayers?.first(where: { $0 is CAEmitterLayer }),
      let emitter = layer as? CAEmitterLayer
    else { return }
    emitter.lifetime = 0
  }

  func removeEmitter() {
    guard
      let layer = view.layer.sublayers?.first(where: { $0 is CAEmitterLayer }),
      let emitter = layer as? CAEmitterLayer
    else { return }
    emitter.removeFromSuperlayer()
  }

  private func confetti(forColor color: UIColor) -> CAEmitterCell {
    let cell = CAEmitterCell()
    cell.birthRate = 30
    cell.lifetime = 6
    cell.color = color.cgColor
    cell.velocity = CGFloat(175)
    cell.velocityRange = CGFloat(40)
    cell.emissionLongitude = .pi
    cell.emissionRange = .pi/4
    cell.spin = CGFloat(1.75)
    cell.spinRange = CGFloat(2)
    cell.contents = #imageLiteral(resourceName: "img-confetti").cgImage

    return cell
  }
}
