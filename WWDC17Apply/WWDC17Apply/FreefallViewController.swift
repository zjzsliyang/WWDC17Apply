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
  
  let baseball = UIImageView(frame: CGRect(x: 700, y: 300, width: 80, height: 80))
  let steelball = UIImageView(frame: CGRect(x: 900, y: 300, width: 80, height: 80))
  
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
    let baseballElasticity = UIDynamicItemBehavior(items: [self.baseball])
    baseballElasticity.elasticity = 0.4
    let steelballElasticity = UIDynamicItemBehavior(items: [self.steelball])
    steelballElasticity.elasticity = 0.6
    animator.addBehavior(baseballElasticity)
    animator.addBehavior(steelballElasticity)
    animator.addBehavior(collision)
  }
  
  func showFallDetail() {
    generateCardView()
    
  }
  
  /* TODO
   1. 优化DetailView 扁平化UI
   2. DetailView出现动画
  */
 
  func generateCardView() {
    cardView.layer.cornerRadius = 20
    cardView.backgroundColor = UIColor(red: 206 / 255, green: 210 / 255, blue: 212 / 255, alpha: 1)
    
    let cardBaseball = UIImageView(image: UIImage(named: "baseball"))
    cardBaseball.frame = CGRect(x: 20, y: -40, width: 80, height: 80)
    cardView.addSubview(cardBaseball)
    
    let baseballDetail = UITextView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
    baseballDetail.text = String("Hello")
    baseballDetail.textColor = UIColor(red: 75 / 255, green: 212 / 255, blue: 167 / 255, alpha: 1)
    cardView.addSubview(baseballDetail)
    
    let cardSteelball = UIImageView(image: UIImage(named: "steelball"))
    cardSteelball.frame = CGRect(x: 20, y: -40, width: 80, height: 80)
    cardView.addSubview(cardSteelball)
    
    self.view.addSubview(cardView)
  }
}
