//
//  BaseViewController.swift
//  PrankSound
//
//  Created by Trịnh Xuân Minh on 18/11/2022.
//

import UIKit

class BaseViewController: UIViewController, ViewProtocol {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addComponents()
    setConstraints()
    setProperties()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setColor()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    addInteractivePopGestureRecognizer()
  }
  
  func addComponents() {}
  
  func setConstraints() {}
  
  func setProperties() {}
  
  func setColor() {}
}

extension BaseViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                         shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
    return true
  }
}

extension BaseViewController {
  func addInteractivePopGestureRecognizer() {
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  }
}
