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
    if AdMobManager.shared.isReady(name: "Interstitial") == true {
      AdMobManager.shared.show(name: "Interstitial", rootViewController: self)
    }
  }
  
  @IBAction func touchShowRewardAd(_ sender: Any) {
    AdMobManager.shared.show(name: "Rewarded", rootViewController: self)
  }
  
  @IBAction func showRewardInterstitialAd(_ sender: Any) {
    AdMobManager.shared.show(name: "Rewarded_Interstitial", rootViewController: self)
  }
  
  @IBAction func touchInterfaceBuilder(_ sender: Any) {
    self.push(to: InterfaceVC(), animated: true)
  }
  
  @IBAction func touchBanner(_ sender: Any) {
    push(to: BannerVC(), animated: true)
  }
}
