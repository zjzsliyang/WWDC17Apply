//
//  ViewController.swift
//  WWDC17
//
//  Created by Yang Li on 09/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  var dynamicAnimator = UIDynamicAnimator()
  let steelballView = UIImageView()
  let bezierPath = UIBezierPath()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    steelballView.image = UIImage(named: "steelball")
    steelballView.frame = CGRect(x: 432, y: 715, width: 100, height: 100)
    self.view.addSubview(steelballView)
    ballPendulum()

  }
  
  override func viewWillAppear(_ animated: Bool) {
    let shapelayer = CAShapeLayer()
    shapelayer.frame = self.view.bounds
    
    bezierPath.move(to: CGPoint(x: 200, y: 200))
    bezierPath.addLine(to: CGPoint(x: 432, y: 715))
    
    
//    bezierPath.addLine(to: CGPoint(x: steelballView.center.x, y: steelballView.center.y))
//    bezierPath.removeAllPoints()
    bezierPath.lineWidth = 20
    shapelayer.path = bezierPath.cgPath
    self.view.layer.addSublayer(shapelayer)
    
  }
  
  func ballPendulum() {
    dynamicAnimator = UIDynamicAnimator(referenceView: view)
    let gravityBehavior = UIGravityBehavior(items: [steelballView])
    dynamicAnimator.addBehavior(gravityBehavior)
    let attachmentBehavior = UIAttachmentBehavior(item: steelballView, attachedToAnchor: CGPoint(x: 200, y: 200))
    
    let nailView = UIImageView(image: UIImage(named: "nail"))
    nailView.frame = CGRect(x: 200, y: 200, width: 30, height: 30)
    view.addSubview(nailView)
    dynamicAnimator.addBehavior(attachmentBehavior)
  }
  
  
}
