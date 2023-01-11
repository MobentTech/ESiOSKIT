//
//  UIViewController+Background.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import AVFoundation
import UIKit

public extension UIViewController {

  private struct AssociationKeys {
    public static var backgroundImageView = "ws_vc_backgroundImageView"
    public static var backgroundPlayerLayer = "ws_vc_backgroundPlayerLayer"
  }

  private var backgroundImageView: UIImageView {
    if let backgroundImageView = objc_getAssociatedObject(self, &AssociationKeys.backgroundImageView)
      as? UIImageView
    {
      return backgroundImageView
    }

    let backgroundImageView = UIImageView()
    backgroundImageView.isHidden = true
    backgroundImageView.clipsToBounds = true

    view.addSubviewAndConstraintToSafeAreaEdges(backgroundImageView)
    view.sendSubviewToBack(backgroundImageView)

    objc_setAssociatedObject(
      self, &AssociationKeys.backgroundImageView, backgroundImageView,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )

    return backgroundImageView
  }

  func showBackgroundImage(_ image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill, animated: Bool) {
    backgroundImageView.image = image
    backgroundImageView.contentMode = contentMode

    backgroundImageView.setHidden(false, animated: animated)
  }

  func hideBackgroundImage(animated: Bool) {
    backgroundImageView.setHidden(true, animated: animated)
  }

  var isBackgroundImageVisible: Bool {
    return backgroundImageView.isHidden == false
  }
}

// MARK: - Background Video

public extension UIViewController {

  private var backgroundPlayerLayer: AVPlayerLayer {

    if let backgroundPlayerLayer = objc_getAssociatedObject(self, &AssociationKeys.backgroundPlayerLayer)
        as? AVPlayerLayer
    {
      return backgroundPlayerLayer
    }

    guard let url = Bundle.main.url(forResource: "login-video", withExtension: "mp4") else {
      assertionFailure("Background video cannot be found.")
      return AVPlayerLayer()
    }

    let player = AVPlayer(url: url)
    player.isMuted = true
    player.allowsExternalPlayback = false
    player.actionAtItemEnd = .none

    player.play()

    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.videoGravity = .resizeAspectFill
    playerLayer.frame = view.layer.bounds

    let dimmerOverlay = CALayer()
    dimmerOverlay.frame = playerLayer.frame
    dimmerOverlay.backgroundColor = UIColor(named: "cc-red")!.withAlphaComponent(0.7).cgColor

    view.layer.insertSublayer(playerLayer, at: 0)
    playerLayer.addSublayer(dimmerOverlay)

    objc_setAssociatedObject(
      self, &AssociationKeys.backgroundPlayerLayer, playerLayer,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )

    addNotifications(
      NotificationCenter.default.observe(name: .playerDidFinish, object: player.currentItem,
                                         using: playerItemDidReachEnd)
    )

    return playerLayer
  }

  @objc private func playerItemDidReachEnd(_ sender: Notification) {
    guard let player = sender.object as? AVPlayerItem else { return }
    player.seek(to: .zero, completionHandler: nil)
  }

  func showBackgroundVideo() {
    backgroundPlayerLayer.isHidden = false
  }

  func hideBackgroundVideo() {
    backgroundPlayerLayer.isHidden = true
  }

  var isBackgroundVideoVisible: Bool {
    return backgroundPlayerLayer.isHidden == false
  }
}
