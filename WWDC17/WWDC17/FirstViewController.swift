//
//  ViewController.swift
//  WWDC17
//
//  Created by Yang Li on 09/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

var times = 0

class FirstViewController: UIViewController {
  let ballButton = UIButton(frame: CGRect(x: 462, y: 633, width: 100, height: 100))
  var ballIsPressed = false
  var dynamicAnimator = UIDynamicAnimator()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 242/255, green: 232/255, blue: 219/255, alpha: 1)
    ballButton.setImage(UIImage(named: "ball"), for: .normal)
    view.addSubview(ballButton)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    ballButton.center = CGPoint(x: view.center.x, y: view.center.y)
    let stack1View = UIImageView(image: UIImage(named: "stake1"))
    let stack2View = UIImageView(image: UIImage(named: "stake2"))
    let gateView = UIImageView(image: UIImage(named: "gate"))
    stack1View.frame = CGRect(x: 818, y: 123, width: 100, height: 90)
    stack2View.frame = CGRect(x: 98, y: 151, width: 100, height: 62)
    gateView.frame = CGRect(x: 387, y: 1196, width: 250, height: 133)
    self.view.addSubview(stack1View)
    self.view.addSubview(stack2View)
    self.view.addSubview(gateView)
    
    ballButton.addTarget(self, action: #selector(ballGravityFall), for: .touchUpInside)
    ballButton.addTarget(self, action: #selector(ballDragOutside), for: .touchDragOutside)
  }
  
  func ballDragOutside() {
    times = times + 1
    print(times)
  }
  
  func ballGravityFall() {
    dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    let gravityBehavior = UIGravityBehavior(items: [self.ballButton])
    gravityBehavior.magnitude = 2
    dynamicAnimator.addBehavior(gravityBehavior)
  }

}
