//
//  Any+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public typealias Callback<T> = (_: T) -> Void
public typealias VoidCallback = () -> Void

public func emptyCallback<T>() -> Callback<T> {
  return { _ in }
}

public func voidCallback() -> VoidCallback {
  return { }
}

public extension Optional where Wrapped: Any {

  func ifNil(_ value: @autoclosure () -> Wrapped) -> Wrapped {
    switch self {
    case .none:
      return value()

    case .some(let value):
      return value
    }
  }
}

// MARK: - FloatingPoint

infix operator ^/ : MultiplicationPrecedence

public extension FloatingPoint {

  static func ^/(lhs: Self, rhs: Self) -> Self {
    if rhs == 0 { return 0 }
    return lhs / rhs
  }
}

// MARK: - CATransaction

public func transaction(closure: VoidCallback, completion: @escaping VoidCallback) {
  CATransaction.begin()
  CATransaction.setCompletionBlock(completion)
  closure()
  CATransaction.commit()
}
