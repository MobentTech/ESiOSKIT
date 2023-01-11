//
//  UITableView+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension UITableView {

  func hideEmptyCells() {
    tableHeaderView = UIView(frame: CGSize.min.toRect)
    tableFooterView = UIView(frame: CGSize.min.toRect)
  }

  func reloadData(animationDuration duration: TimeInterval) {
    UIView.transition(
      with: self,
      duration: duration,
      options: UIView.AnimationOptions.transitionCrossDissolve,
      animations: reloadData, completion: nil)
  }

  func insertRows(
    at indexPaths: [IndexPath],
    animation: UITableView.RowAnimation = .none
  ) {
    let insert = { self.insertRows(at: indexPaths, with: animation) }

    switch animation {
    case .none:
      UITableView.performWithoutAnimation(insert)

    default:
      beginAndEndUpdates(with: insert)
    }
  }

  func deleteRows(
    at indexPaths: [IndexPath],
    animation: UITableView.RowAnimation = .none
  ) {
    let delete = { self.deleteRows(at: indexPaths, with: animation) }

    switch animation {
    case .none:
      UITableView.performWithoutAnimation(delete)

    default:
      beginAndEndUpdates(with: delete)
    }
  }

  func reloadRows(at indexPaths: [IndexPath]) {
    UITableView.performWithoutAnimation {
      reloadRows(at: indexPaths, with: UITableView.RowAnimation.none)
    }
  }

  func reloadSections(_ sections: IndexSet) {
    UITableView.performWithoutAnimation {
      reloadSections(sections, with: UITableView.RowAnimation.none)
    }
  }

  func cellForRow<T: UITableViewCell>(at indexPath: IndexPath) -> T? {
    return cellForRow(at: indexPath) as? T
  }

  func headerView<T: UITableViewHeaderFooterView>(forSection section: Int) -> T? {
    return headerView(forSection: section) as? T
  }

  func footerView<T: UITableViewHeaderFooterView>(forSection section: Int) -> T? {
    return footerView(forSection: section) as? T
  }

  @discardableResult func safelyScrollToRow(
    at indexPath: IndexPath,
    at scrollPosition: UITableView.ScrollPosition, animated: Bool) -> Bool
  {
    if cellForRow(at: indexPath) != nil {
      return false
    }
    else if
      indexPath.section < numberOfSections &&
      indexPath.row < numberOfRows(inSection: indexPath.section)
    {
      scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
      return true
    }
    else {
      return false
    }
  }

  override func scrollToTop(animated: Bool) {
    if safelyScrollToRow(at: .zero, at: .bottom, animated: animated) == false {
      super.scrollToTop(animated: animated)
    }
  }

  func setTableHeaderView(_ tableHeaderView: UIView, usesAutoresizingMask: Bool = true) {
    tableHeaderView.translatesAutoresizingMaskIntoConstraints = usesAutoresizingMask

    self.tableHeaderView = tableHeaderView
    defer { self.tableHeaderView = tableHeaderView }

    if usesAutoresizingMask {
      tableHeaderView.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
    }
    else {
      NSLayoutConstraint.activate([
        tableHeaderView.widthAnchor.constraint(equalTo: widthAnchor),
        tableHeaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
        tableHeaderView.topAnchor.constraint(equalTo: topAnchor)
      ])
    }
    tableHeaderView.setNeedsLayout()
    tableHeaderView.layoutIfNeeded()

    if usesAutoresizingMask {
      let fittingSize = CGSize(width: bounds.size.width, height: UIView.layoutFittingCompressedSize.height)
      tableHeaderView.frame.size.height = tableHeaderView.systemLayoutSizeFitting(fittingSize).height
    }
  }

  func beginAndEndUpdates(with block: VoidCallback? = .none) {
    beginUpdates()
    block?()
    endUpdates()
  }

  func performUpdate(_ update: @escaping Callback<UITableView>, completion: @escaping VoidCallback) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)

    beginAndEndUpdates { update(self) }
    CATransaction.commit()
  }

  func setTableFooterView(_ tableFooterView: UIView) {
    tableFooterView.translatesAutoresizingMaskIntoConstraints = true

    self.tableFooterView = tableFooterView
    defer { self.tableFooterView = tableFooterView }

    tableFooterView.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
    tableFooterView.setNeedsLayout()
    tableFooterView.layoutIfNeeded()

    let fittingSize = CGSize(width: bounds.size.width, height: UIView.layoutFittingCompressedSize.height)
    tableFooterView.frame.size.height = tableFooterView.systemLayoutSizeFitting(fittingSize).height
  }

  // swiftlint:disable identifier_name force_cast
  func dequeueReusableCell<T: UITableViewCell>(identifier: String, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
  }

  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(identifier: String) -> T {
    return dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
  }

  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
    return dequeueReusableHeaderFooterView(identifier: String(describing: T.self))
  }
  // swiftlint:enable identifier_name force_cast

  func registerCells(for types: [UITableViewCell.Type]) {
    types.forEach { type in
      register(type.nib, forCellReuseIdentifier: String(describing: type))
    }
  }

  func registerCells(classes: [UITableViewCell.Type]) {
    classes.forEach { klazz in
      register(klazz, forCellReuseIdentifier: String(describing: klazz))
    }
  }

  func registerSectionHeaderFooter(for type: UITableViewHeaderFooterView.Type) {
    registerSectionHeaderFooters(for: [type])
  }

  func registerSectionHeaderFooters(for types: [UITableViewHeaderFooterView.Type]) {
    for type in types {
      register(type.nib, forHeaderFooterViewReuseIdentifier: String(describing: type))
    }
  }

  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    let identifier = String(describing: T.self)
    return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
  }

  func header<T: UITableViewHeaderFooterView>(forSection section: Int) -> T? {
    return headerView(forSection: section) as? T
  }

  func footer<T: UITableViewHeaderFooterView>(forSection section: Int) -> T? {
    return footerView(forSection: section) as? T
  }

  func roundedCorners(forRowAt indexPath: IndexPath) -> CACornerMask? {
    let isFirstItem = indexPath.isFirstRow
    let isLastItem = indexPath.isLastRow(at: self)

    if isFirstItem && isLastItem {
      return CALayer.allCorners
    }
    else if isFirstItem {
      return CALayer.topCorners
    }
    else if isLastItem {
      return CALayer.bottomCorners
    }
    else {
      return .none
    }
  }
}

public extension UITableView {

  enum SectionType: Int {
    case header
    case footer
  }

  func reloadData(completion: @escaping VoidCallback) {
    transaction(closure: reloadData, completion: completion)
  }

  func insertSections(_ sections: IndexSet, with animation: UITableView.RowAnimation,
                      completion: @escaping VoidCallback)
  {
    transaction(closure: {
      self.insertSections(sections, with: animation)
    }, completion: completion)
  }
}

// MARK: - RefreshControl

public extension UIScrollView {

  func setRefresher(color: UIColor = UIColor.black, selector: Selector) {
    let refresher = UIRefreshControl()
    refresher.tintColor = color
    refresher.addTarget(.none, action: selector, for: UIControl.Event.valueChanged)
    refreshControl = refresher
  }

  func endRefreshing() {
    refreshControl?.endRefreshing()
  }
}
