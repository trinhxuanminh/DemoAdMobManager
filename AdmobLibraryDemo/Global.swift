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
    
//    AdMobManager.shared.upgradePremium()
    
    if let url = Bundle.main.url(forResource: "testData", withExtension: "json"),
       let data = try? Data(contentsOf: url) {
      AdMobManager.shared.register(remoteKey: "ADMOB_V1_0", defaultData: data)
    }
  }
}
