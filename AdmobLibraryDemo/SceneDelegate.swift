//
//  SceneDelegate.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 24/03/2022.
//

import UIKit
import AdMobManager

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    guard let topVC = UIApplication.topStackViewController() else {
      return
    }
    AdMobManager.shared.show(type: .appOpen,
                             name: "App_Open",
                             rootViewController: topVC,
                             didFail: nil,
                             didHide: nil)
  }
}

