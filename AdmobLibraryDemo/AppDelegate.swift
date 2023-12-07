//
//  AppDelegate.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 24/03/2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Override point for customization after application launch.
    FirebaseApp.configure()
    Global.shared.fetch()
    return true
  }
}
