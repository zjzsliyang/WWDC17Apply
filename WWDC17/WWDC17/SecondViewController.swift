//
//  SecondViewController.swift
//  WWDC17
//
//  Created by Yang Li on 11/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  var dynamicAnimator = UIDynamicAnimator()
  var gravitationalAcceleration = 2.0
  @IBOutlet weak var football: UIImageView!
  @IBOutlet weak var baseball: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ballGravityFall()
    // Do any additional setup after loading the view.
  }
  
  func ballGravityFall() {
    dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    let gravityBehavior = UIGravityBehavior(items: [self.baseball, self.football])
    gravityBehavior.magnitude = CGFloat(gravitationalAcceleration)
    dynamicAnimator.addBehavior(gravityBehavior)
  }
  
}
