//
//  UITableViewCell+Capabilities.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

public struct CellCapabilities {

  public let showsHeader: Bool
  public let isRounded: Bool
  public let displayCount: Int
  public let isDisplayingAll: Bool
  public let indexPath: IndexPath

  public init(showsHeader: Bool, isRounded: Bool, displayCount: Int, isDisplayingAll: Bool, indexPath: IndexPath) {
    self.showsHeader = showsHeader
    self.isRounded = isRounded
    self.displayCount = displayCount
    self.isDisplayingAll = isDisplayingAll
    self.indexPath = indexPath
  }

  public init(isRounded: Bool, displayCount: Int, isDisplayingAll: Bool, indexPath: IndexPath) {
    self.init(
      showsHeader: false,
      isRounded: isRounded,
      displayCount: displayCount,
      isDisplayingAll: isDisplayingAll,
      indexPath: indexPath
    )
  }

  public init(isRounded: Bool, indexPath: IndexPath) {
    self.init(isRounded: isRounded, displayCount: Int.max, isDisplayingAll: true, indexPath: indexPath)
  }

  public init(showsHeader: Bool, indexPath: IndexPath) {
    self.init(
      showsHeader: showsHeader,
      isRounded: false,
      displayCount: Int.max,
      isDisplayingAll: true,
      indexPath: indexPath
    )
  }

  public init(showsHeader: Bool, isDisplayingAll: Bool, indexPath: IndexPath) {
    self.init(
      showsHeader: showsHeader,
      isRounded: false,
      displayCount: Int.max,
      isDisplayingAll: isDisplayingAll,
      indexPath: indexPath
    )
  }
}
