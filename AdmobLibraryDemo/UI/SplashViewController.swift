//
//  SplashViewController.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 25/03/2022.
//

import UIKit
import AdMobManager
import Combine

class SplashViewController: UIViewController {
  private var subscriptions = [AnyCancellable]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    AdMobManager.shared.$state
      .receive(on: DispatchQueue.main)
      .sink { [weak self] state in
        guard let self else {
          return
        }
        if state == .allow {
          AdMobManager.shared.load(type: .splash, name: "Splash")
          AdMobManager.shared.load(type: .interstitial, name: "Interstitial_1")
          AdMobManager.shared.load(type: .interstitial, name: "Interstitial_2")
          AdMobManager.shared.load(type: .rewarded, name: "Rewarded")
          AdMobManager.shared.load(type: .rewardedInterstitial, name: "Rewarded_Interstitial")
          AdMobManager.shared.preloadNative(name: "Native")
        }
        
        if state != .unknow {
          AdMobManager.shared.show(type: .splash,
                                   name: "Splash",
                                   rootViewController: self,
                                   didFail: self.toSecondViewController,
                                   didHide: self.toSecondViewController)
        }
      }.store(in: &subscriptions)
  }
  
  func toSecondViewController() {
    self.push(to: SecondViewController(), animated: false)
  }
}
