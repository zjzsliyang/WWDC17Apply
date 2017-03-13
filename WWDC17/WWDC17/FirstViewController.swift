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
  @IBOutlet var tapGesture: UITapGestureRecognizer!
  @IBOutlet weak var ballOutlet: UIButton!
  var ballIsPressed = false
  var dynamicAnimator = UIDynamicAnimator()
  
  @IBAction func ballButton(_ sender: UIButton) {
    ballGravityFall()
  }

  @IBAction func dragOutside(_ sender: UIButton) {
    times = times + 1
    print("hello")
    print(times)
    print(String(describing: sender))
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 242/255, green: 232/255, blue: 219/255, alpha: 1)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    ballOutlet.center = CGPoint(x: view.center.x, y: view.center.y)
  }
  
  func ballGravityFall() {
    dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    let gravityBehavior = UIGravityBehavior(items: [self.ballOutlet])
    gravityBehavior.magnitude = 2
    dynamicAnimator.addBehavior(gravityBehavior)
  }

}

