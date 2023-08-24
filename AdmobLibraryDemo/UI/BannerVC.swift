//
//  BannerVC.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 06/06/2023.
//

import UIKit
import AdMobManager
import SnapKit
import NVActivityIndicatorView

class BannerVC: BaseViewController {
  @IBOutlet weak var bannerAdMobView: BannerAdMobView!
  private lazy var loadingView: NVActivityIndicatorView = {
    let loadingView = NVActivityIndicatorView(frame: .zero)
    loadingView.type = .ballPulse
    loadingView.padding = 30.0
    return loadingView
  }()
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    bannerAdMobView.load(name: "Banner_3")
  }
  
  override func addComponents() {
    view.addSubview(loadingView)
  }
  
  override func setConstraints() {
    loadingView.snp.makeConstraints { make in
      make.center.equalTo(bannerAdMobView)
      make.width.height.equalTo(20)
    }
  }
  
  override func setProperties() {
    loadingView.startAnimating()
    bannerAdMobView.binding { [weak self] in
      guard let self = self else {
        return
      }
      self.loadingView.stopAnimating()
    }
  }
  
  override func setColor() {
    changeLoading(color: .white)
  }
  
  private func changeLoading(color: UIColor) {
    var isAnimating = false
    if loadingView.isAnimating {
      isAnimating = true
      loadingView.stopAnimating()
    }
    loadingView.color = color
    guard isAnimating else {
      return
    }
    loadingView.startAnimating()
  }
}
