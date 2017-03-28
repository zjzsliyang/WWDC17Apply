//
//  BrachistochroneViewController.swift
//  WWDC17Apply
//
//  Created by Yang Li on 19/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

class BrachistochroneViewController: UIViewController, UICollisionBehaviorDelegate {
  let firstView = UIView()
  let secondView = UIView()
  let thirdView = UIView()
  
  let gravity = UIGravityBehavior()
  let collision = UICollisionBehavior()
  var animator = UIDynamicAnimator()
  
  var balls = [Ball]()
  let ballSize: CGFloat = 20
  
  let xOffset: CGFloat = 50
  var yOffset: CGFloat = 50
  let xWidth: CGFloat = 270
  let yHeight: CGFloat = 368 / 3
  let gap: CGFloat = 40
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initAnimationView()
    yOffset = 50
    
    for index in 0..<3 {
      addBall(index: index)
      let startPoint = CGPoint(x: xOffset, y: yOffset)
      let endPoint = CGPoint(x: xOffset + xWidth, y: yOffset + yHeight)
      
      collision.addBoundary(withIdentifier: self.pathIdentifierAt(index: index) as NSCopying, for: self.pathAtIndex(index: index, startPoint: startPoint, endPoint: endPoint)!)
      collision.addBoundary(withIdentifier: self.lineIdentifierAt(index: index) as NSCopying, from: CGPoint(x: endPoint.x, y: startPoint.y), to: endPoint)
      yOffset += gap + yHeight
    }
    
    collision.translatesReferenceBoundsIntoBoundary = true
    collision.collisionDelegate = self
    self.animator = UIDynamicAnimator(referenceView: self.view)

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    for (index, ball) in balls.enumerated() {
      ball.center = self.ballPositionAtIndex(index: index)
      self.gravity.addItem(ball)
      self.collision.addItem(ball)
    }
    self.animator.addBehavior(gravity)
    self.animator.addBehavior(collision)
  }
  
  func pathIdentifierAt(index: Int) -> NSCopying {
    return ("BeziperPath" + "\(index)") as NSCopying
  }
  func lineIdentifierAt(index: Int) -> NSCopying {
    return ("VerticalLine" + "\(index)") as NSCopying
  }
  
  func ballPositionAtIndex(index: Int) -> CGPoint {
    var point = CGPoint(x: xOffset + ballSize / 2, y: CGFloat(index) * (yHeight + gap) + 50)
    if index == 0 {
      point.y -= 7
    }
    return point
  }
  
  func pathAtIndex(index: Int, startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath? {
    switch index {
    case 0:
      return self.straightPath(startPoint: startPoint, endPoint: endPoint)
    case 1:
      return self.curvePath1(startPoint: startPoint, endPoint: endPoint)
    case 2:
      return self.curvePath2(startPoint: startPoint, endPoint: endPoint)
    default:
      print("INDEX ERROR")
      return nil
    }
  }
  
  func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
    let ball = item as! Ball
    let index = balls.index(of: ball)
    if identifier as! String == self.lineIdentifierAt(index: index!) as! String {
      self.gravity.removeItem(item)
      self.collision.removeItem(ball)
      if self.gravity.items.count == 0 {
        self.animator.removeBehavior(gravity)
        self.animator.removeBehavior(collision)
      }
    }
  }
  
  func straightPath(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: startPoint)
    bezierPath.addLine(to: endPoint)
    addShapeLayerWithPath(path: bezierPath)
    return bezierPath
  }
  
  func curvePath1(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: startPoint)
    bezierPath.addQuadCurve(to: endPoint, controlPoint: CGPoint(x: xOffset + 50.0, y: endPoint.y))
    bezierPath.addQuadCurve(to: startPoint, controlPoint: CGPoint(x: xOffset + 50.0, y: endPoint.y))
    addShapeLayerWithPath(path: bezierPath)
    return bezierPath
  }
  
  func curvePath2(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: startPoint)
    bezierPath.addCurve(to: endPoint, controlPoint1: CGPoint(x: xOffset + 5.0, y: endPoint.y - 5.0), controlPoint2: CGPoint(x: xOffset + 15.0, y: endPoint.y))
    bezierPath.addCurve(to: startPoint, controlPoint1: CGPoint(x: xOffset + 15.0, y: endPoint.y), controlPoint2: CGPoint(x: xOffset + 5.0, y: endPoint.y - 5))
    addShapeLayerWithPath(path: bezierPath)
    return bezierPath
  }
  
  func addShapeLayerWithPath(path: UIBezierPath) {
    let pathLayer = CAShapeLayer()
    pathLayer.path = path.cgPath
    pathLayer.fillColor = UIColor.clear.cgColor
    pathLayer.strokeColor = UIColor(colorLiteralRed: 242 / 255, green: 123 / 255, blue: 154 / 255, alpha: 1).cgColor
    pathLayer.lineWidth = 2.0
    self.view.layer.addSublayer(pathLayer)
  }
  
  func initAnimationView() {
    self.firstView.frame = CGRect(x: 40, y: 34, width: 295, height: 143)
    self.firstView.layer.borderWidth = 2.0
    self.firstView.layer.borderColor = UIColor.gray.cgColor
    self.view.addSubview(firstView)
    
    self.secondView.frame = CGRect(x: 40, y: 197, width: 295, height: 143)
    self.secondView.layer.borderWidth = 2.0
    self.secondView.layer.borderColor = UIColor.gray.cgColor
    self.view.addSubview(secondView)
    
    self.thirdView.frame = CGRect(x: 40, y: 365, width: 295, height: 143)
    self.thirdView.layer.borderWidth = 2.0
    self.thirdView.layer.borderColor = UIColor.gray.cgColor
    self.view.addSubview(thirdView)
  }
  
  func addBall(index: Int) {
    let ball = Ball(image: UIImage(named: "ball"))
    ball.frame = CGRect(x: 0, y: 0, width: ballSize, height: ballSize)
    self.view.addSubview(ball)
    self.balls.append(ball)
  }
  
  class Ball: UIImageView {
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
      return .ellipse
    }
  }
}
