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
    AdMobManager.shared.activeDebug(testDeviceIdentifiers: ["3ECCFEAA-3A9D-41C9-8FBE-9AFB0D65B837"],
                                    reset: true)
    
//    AdMobManager.shared.upgradePremium()
    
    if let url = Bundle.main.url(forResource: "testData", withExtension: "json"),
       let data = try? Data(contentsOf: url) {
      AdMobManager.shared.register(remoteKey: "ADMOB_V1_0", defaultData: data)
    }
  }
}
