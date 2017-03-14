//
//  ThirdViewController.swift
//  WWDC17
//
//  Created by Yang Li on 11/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let backgroundView = UIImageView(image: UIImage(named: "sky"))
    backgroundView.frame = self.view.bounds
    backgroundView.contentMode = .scaleAspectFill
    self.view.addSubview(backgroundView)
    
    let animationView = AnimationView(frame: self.view.bounds)
    self.view.addSubview(animationView)
    animationView.animationSpeed(earthSpeeds: 1.0, rocketSpeeds: 2.0)
  }
}
