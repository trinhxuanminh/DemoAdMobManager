//
//  SplashViewController.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 25/03/2022.
//

import UIKit
import AdMobManager

class SplashViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func viewDidAppear(_ animated: Bool) {
    AdMobManager.shared.addActionSuccessRegister { [weak self] in
      guard let self = self else {
        return
      }
      AdMobManager.shared.show(name: "Splash", rootViewController: self, didShow: self.toSecondViewController, didFail: self.toSecondViewController)
    }
  }

  func toSecondViewController() {
    
    self.push(to: SecondViewController(), animated: false)
  }
}
