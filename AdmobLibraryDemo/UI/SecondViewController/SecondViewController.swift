//
//  SecondViewController.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 25/03/2022.
//

import UIKit
import AdMobManager

class SecondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    AdMobManager.shared.load(type: .appOpen, name: "App_Open")
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
  }
  
  @IBAction func touchShowInterstitialAd(_ sender: Any) {
    AdMobManager.shared.show(type: .interstitial,
                             name: "Interstitial_1",
                             rootViewController: self,
                             didFail: nil,
                             didHide: nil)
  }
  
  @IBAction func touchShowRewardAd(_ sender: Any) {
    AdMobManager.shared.show(type: .rewarded,
                             name: "Rewarded",
                             rootViewController: self, didFail: {
      print("Fail")
    }, didEarnReward: {
      print("Earn Reward")
    }, didHide: {
      print("Hide")
    })
  }
  
  @IBAction func showRewardInterstitialAd(_ sender: Any) {
    AdMobManager.shared.show(type: .rewardedInterstitial,
                             name: "Rewarded_Interstitial",
                             rootViewController: self, didFail: {
      print("Fail")
    }, didEarnReward: {
      print("Earn Reward")
    }, didHide: {
      print("Hide")
    })
  }
  
  @IBAction func touchInterfaceBuilder(_ sender: Any) {
    self.push(to: InterfaceVC(), animated: true)
  }
  
  @IBAction func touchBanner(_ sender: Any) {
    push(to: BannerVC(), animated: true)
  }
  
  @IBAction func touchSettingPrivacy(_ sender: Any) {
    AdMobManager.shared.requestConsentUpdate()
  }
}
