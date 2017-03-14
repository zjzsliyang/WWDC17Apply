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
  let football = UIImageView(frame: CGRect(x: 209, y: 311, width: 128, height: 128))
  let baseball = UIImageView(frame: CGRect(x: 72, y: 359, width: 80, height: 80))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let pisaTower = UIImageView(frame: CGRect(x: 633, y: 175, width: 391, height: 1191))
    pisaTower.image = UIImage(named: "PisaTower")
    pisaTower.contentMode = .scaleAspectFill
    self.view.addSubview(pisaTower)
    
    football.image = UIImage(named: "ball")
    football.contentMode = .scaleToFill
    self.view.addSubview(football)
    
    baseball.image = UIImage(named: "baseball")
    baseball.contentMode = .scaleAspectFit
    self.view.addSubview(baseball)
    
    
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
