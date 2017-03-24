//
//  FreefallViewController.swift
//  WWDC17Apply
//
//  Created by Yang Li on 24/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

class FreefallViewController: UIViewController {
  var animator = UIDynamicAnimator()
  var gravitationalAcceleration = 2.0
  
  let baseball = UIImageView(frame: CGRect(x: 700, y: 311, width: 80, height: 80))
  let steelball = UIImageView(frame: CGRect(x: 900, y: 359, width: 80, height: 80))
  
  let cardView = UIView(frame: CGRect(x: 100, y: 500, width: 400, height: 200))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    baseball.image = UIImage(named: "baseball")
    baseball.contentMode = .scaleToFill
    self.view.addSubview(baseball)
    
    steelball.image = UIImage(named: "steelball")
    steelball.contentMode = .scaleAspectFit
    self.view.addSubview(steelball)
    
    ballGravityFall()
    showFallDetail()
  }
  
  func ballGravityFall() {
    animator = UIDynamicAnimator(referenceView: self.view)
    let gravity = UIGravityBehavior(items: [self.baseball, self.steelball])
    gravity.magnitude = CGFloat(gravitationalAcceleration)
    animator.addBehavior(gravity)
    let collision = UICollisionBehavior(items: [self.baseball, self.steelball])
    collision.translatesReferenceBoundsIntoBoundary = true
    animator.addBehavior(collision)
  }
  
  func showFallDetail() {
    generateCardView()
    
  }
  
  func generateCardView() {
    cardView.layer.cornerRadius = 20
    cardView.backgroundColor = UIColor.lightGray
    
    let cardBaseball = UIImageView(image: UIImage(named: "baseball"))
    cardBaseball.frame = CGRect(x: 20, y: -40, width: 80, height: 80)
    cardView.addSubview(cardBaseball)
    
    let cardSteelball = UIImageView(image: UIImage(named: "steelball"))
    cardSteelball.frame = CGRect(x: 20, y: -40, width: 80, height: 80)
    cardView.addSubview(cardSteelball)
    
    self.view.addSubview(cardView)
  }
}
