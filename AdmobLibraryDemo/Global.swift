//
//  Global.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 07/12/2023.
//

import Foundation
import Combine
import AdMobManager

class Global {
  static let shared = Global()
  
  private var subscriptions = [AnyCancellable]()
}

extension Global {
  func fetch() {
    AdMobManager.shared.activeDebug(testDeviceIdentifiers: ["F30F750C-7BEE-4E11-BB0A-DE036C2006F2"],
                                    reset: true)
    
    AdMobManager.shared.upgradePremium()
    
    AdMobManager.shared.$state
      .receive(on: DispatchQueue.main)
      .sink { state in
        guard state == .allow else {
          return
        }
        AdMobManager.shared.load(type: .splash, name: "Splash")
        AdMobManager.shared.load(type: .interstitial, name: "Interstitial_1")
        AdMobManager.shared.load(type: .interstitial, name: "Interstitial_2")
        AdMobManager.shared.load(type: .rewarded, name: "Rewarded")
        AdMobManager.shared.load(type: .rewardedInterstitial, name: "Rewarded_Interstitial")
        AdMobManager.shared.preloadNative(name: "Native_1")
      }.store(in: &subscriptions)
    
    if let url = Bundle.main.url(forResource: "testData", withExtension: "json"),
       let data = try? Data(contentsOf: url) {
      AdMobManager.shared.register(defaultData: data)
    }
  }
}
