//
//  SplashViewController.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 25/03/2022.
//

import UIKit
import AdMobManager

class SplashViewController: UIViewController {

  @IBOutlet weak var timeButton: UIButton!

  fileprivate var timeInterval: Double = 0.1
  fileprivate var maxTime: Double = 30.0
  fileprivate var time: Double = 0.0
  fileprivate var timer: Timer?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func viewDidAppear(_ animated: Bool) {
    self.timer = Timer.scheduledTimer(timeInterval: self.timeInterval, target: self, selector: #selector(self.setLoading), userInfo: nil, repeats: true)
  }

  @IBAction func touchSetTime(_ sender: Any) {
    self.time = 0.0
  }

  @objc func setLoading() {
    self.time += self.timeInterval

    var timeLoading: Int = Int(self.time / self.maxTime * 100)
    if timeLoading > 100 {
      timeLoading = 100
    }
    self.timeButton.setTitle("\(timeLoading)%", for: .normal)

    if let ready = AdMobManager.shared.isReady(name: "Interstitial"), ready {
      self.timeInterval = 1.0
    }

    if self.time >= self.maxTime {
      self.timer?.invalidate()
      self.timer = nil

      if let ready = AdMobManager.shared.isReady(name: "Interstitial"), ready {
        AdMobManager.shared.show(name: "Interstitial", willPresent: self.toSecondViewController)
      } else {
        self.toSecondViewController()
      }
    }
  }

  func toSecondViewController() {
    self.push(to: SecondViewController(), animated: false)
  }
}
