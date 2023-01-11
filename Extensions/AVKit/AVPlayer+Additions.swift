//
//  AVPlayer+Additions.swift
//  E-Commerce
//
//  Created by Emre Çiftçi on 3.01.2022.
//

import AVKit

public extension AVPlayer {

  var isPlaying: Bool {
    return !rate.isZero && error == nil
  }
}
