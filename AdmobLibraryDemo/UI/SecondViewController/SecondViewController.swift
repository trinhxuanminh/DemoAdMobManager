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
    
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
  }
  
  @IBAction func touchShowInterstitialAd(_ sender: Any) {
    AdMobManager.shared.show(key: "Interstitial")
  }
  
  @IBAction func touchShowRewardAd(_ sender: Any) {
    AdMobManager.shared.show(key: "Rewarded")
  }
  
  @IBAction func showRewardInterstitialAd(_ sender: Any) {
    AdMobManager.shared.show(key: "RewardedInterstitial")
  }
  
  @IBAction func touchInterfaceBuilder(_ sender: Any) {
    self.push(to: InterfaceVC(), animated: true)
  }
  
  @IBAction func touchBanner(_ sender: Any) {
    push(to: BannerVC(), animated: true)
  }
}
