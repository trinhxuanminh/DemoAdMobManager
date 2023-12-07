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
        guard state != .unknow else {
          return
        }
        AdMobManager.shared.show(type: .splash,
                                 name: "Splash",
                                 rootViewController: self,
                                 didFail: self.toSecondViewController,
                                 didHide: self.toSecondViewController)
      }.store(in: &subscriptions)
  }
  
  func toSecondViewController() {
    self.push(to: SecondViewController(), animated: false)
  }
}
