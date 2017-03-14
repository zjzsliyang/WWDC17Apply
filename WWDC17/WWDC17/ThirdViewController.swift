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
    let animaView = animationView(frame: self.view.bounds)
    self.view.addSubview(animaView)
    animaView.animationView(earthSpeeds: 1.0, rocketSpeeds: 2.0)
    
    var forceLevel : Double = 50
    let outletForce = UILabel(frame: CGRect(x: 150, y: 460, width: 100, height: 30))
    outletForce.text = "F = " + String(forceLevel) + "N"
    outletForce.textColor = UIColor.white
    self.view.addSubview(outletForce)
  }
  
}
