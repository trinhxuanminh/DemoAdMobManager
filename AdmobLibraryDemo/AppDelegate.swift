//
//  AppDelegate.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 24/03/2022.
//

import UIKit
import GoogleMobileAds
import AdMobManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Override point for customization after application launch.
    GADMobileAds.sharedInstance().start(completionHandler: nil)
//    GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["2077ef9a63d2b398840261c8221a0c9b"] // Sample device ID
    
//    let bannerId = "ca-app-pub-3940256099942544/2934735716"
//    let interstitialID = "ca-app-pub-3940256099942544/4411468910"
//    let nativeID = "ca-app-pub-3940256099942544/3986624511"
//    let appOpenID = "ca-app-pub-3940256099942544/5662855259"
//    let rewardID = "ca-app-pub-3940256099942544/1712485313"
    
    AdMobManager.shared.register(key: "AppOpen", type: .appOpen, id: "ca-app-pub-3940256099942544/5662855259")
    AdMobManager.shared.register(key: "Interstitial", type: .interstitial, id: "ca-app-pub-3940256099942544/4411468910")
    AdMobManager.shared.register(key: "Rewarded", type: .rewarded, id: "ca-app-pub-3940256099942544/1712485313")
    AdMobManager.shared.register(key: "RewardedInterstitial", type: .rewardedInterstitial, id: "ca-app-pub-3940256099942544/6978759866")
    
    AdMobManager.shared.setTimeBetween(key: "AppOpen", time: 4.0)
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    AdMobManager.shared.show(key: "AppOpen")
  }
  
  @available(iOS 13.0, *)
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  @available(iOS 13.0, *)
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
  
  
}
