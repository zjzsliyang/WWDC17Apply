//
//  LiveView.swift
//
//  Copyright © 2016,2017 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

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

let minScaleLimit: CGFloat = 0.5
let maxScaleLimit: CGFloat = 4


public func initAnimationView() {
  firstView.frame = CGRect(x: 40, y: 34, width: 295, height: 143)
  firstView.layer.borderWidth = 2.0
  firstView.layer.borderColor = UIColor.gray.cgColor
  BrachistochroneViewController.view.addSubview(firstView)
  
  secondView.frame = CGRect(x: 40, y: 197, width: 295, height: 143)
  secondView.layer.borderWidth = 2.0
  secondView.layer.borderColor = UIColor.gray.cgColor
  BrachistochroneViewController.view.addSubview(secondView)
  
  thirdView.frame = CGRect(x: 40, y: 365, width: 295, height: 143)
  thirdView.layer.borderWidth = 2.0
  thirdView.layer.borderColor = UIColor.gray.cgColor
  BrachistochroneViewController.view.addSubview(thirdView)
}

let BrachistochroneViewController = UIViewController()
initAnimationView()
yOffset = 50

public func pathIdentifierAt(index: Int) -> NSCopying {
  return ("BeziperPath" + "\(index)") as NSCopying
}
public func lineIdentifierAt(index: Int) -> NSCopying {
  return ("VerticalLine" + "\(index)") as NSCopying
}

public func ballPositionAtIndex(index: Int) -> CGPoint {
  var point = CGPoint(x: xOffset + ballSize / 2, y: (CGFloat(index) * (yHeight + gap) + 50))
  if index == 0 {
    point.y -= 7
  }
  return point
}

public func pathAtIndex(index: Int, startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath? {
  switch index {
  case 0:
    return straightPath(startPoint: startPoint, endPoint: endPoint)
  case 1:
    return curvePath1(startPoint: startPoint, endPoint: endPoint)
  case 2:
    return curvePath2(startPoint: startPoint, endPoint: endPoint)
  default:
    print("INDEX ERROR")
    return nil
  }
}

public func straightPath(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
  let bezierPath = UIBezierPath()
  bezierPath.move(to: startPoint)
  bezierPath.addLine(to: endPoint)
  addShapeLayerWithPath(path: bezierPath)
  return bezierPath
}

public func curvePath1(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
  let bezierPath = UIBezierPath()
  bezierPath.move(to: startPoint)
  bezierPath.addQuadCurve(to: endPoint, controlPoint: CGPoint(x: xOffset + 50.0, y: endPoint.y))
  bezierPath.addQuadCurve(to: startPoint, controlPoint: CGPoint(x: xOffset + 50.0, y: endPoint.y))
  addShapeLayerWithPath(path: bezierPath)
  return bezierPath
}

public func curvePath2(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
  let bezierPath = UIBezierPath()
  bezierPath.move(to: startPoint)
  bezierPath.addCurve(to: endPoint, controlPoint1: CGPoint(x: xOffset + 5.0, y: endPoint.y - 5.0), controlPoint2: CGPoint(x: xOffset + 15.0, y: endPoint.y))
  bezierPath.addCurve(to: startPoint, controlPoint1: CGPoint(x: xOffset + 15.0, y: endPoint.y), controlPoint2: CGPoint(x: xOffset + 5.0, y: endPoint.y - 5.0))
  addShapeLayerWithPath(path: bezierPath)
  return bezierPath
}

public func addShapeLayerWithPath(path: UIBezierPath) {
  let pathLayer = CAShapeLayer()
  pathLayer.path = path.cgPath
  pathLayer.fillColor = UIColor.clear.cgColor
  pathLayer.strokeColor = UIColor(colorLiteralRed: 242 / 255, green: 123 / 255, blue: 154 / 255, alpha: 1).cgColor
  pathLayer.lineWidth = 2.0
  BrachistochroneViewController.view.layer.addSublayer(pathLayer)
}

public func addBall(index: Int) {
  let ball = Ball(image: UIImage(named: "ball.png"))
  ball.frame = CGRect(x: 0, y: 0, width: ballSize, height: ballSize)
  BrachistochroneViewController.view.addSubview(ball)
  balls.append(ball)
}

for index in 0..<3 {
  addBall(index: index)
  let startPoint = CGPoint(x: xOffset, y: yOffset)
  let endPoint = CGPoint(x: xOffset + xWidth, y: yOffset + yHeight)
  
  collision.addBoundary(withIdentifier: pathIdentifierAt(index: index) as NSCopying, for: pathAtIndex(index: index, startPoint: startPoint, endPoint: endPoint)!)
  collision.addBoundary(withIdentifier: lineIdentifierAt(index: index) as NSCopying, from: CGPoint(x: endPoint.x, y: startPoint.y), to: endPoint)
  yOffset += gap + yHeight
}

collision.translatesReferenceBoundsIntoBoundary = true
animator = UIDynamicAnimator(referenceView: BrachistochroneViewController.view)

PlaygroundPage.current.liveView = BrachistochroneViewController
for (index, ball) in balls.enumerated() {
  ball.center = ballPositionAtIndex(index: index)
}

public func startAnimation() {
  for (index, ball) in balls.enumerated() {
    ball.center = ballPositionAtIndex(index: index)
    gravity.addItem(ball)
    collision.addItem(ball)
  }
  animator.addBehavior(gravity)
  animator.addBehavior(collision)
}

public func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
  let ball = item as! Ball
  let index = balls.index(of: ball)
  if identifier as! String == lineIdentifierAt(index: index!) as! String {
    gravity.removeItem(item)
    collision.removeItem(ball)
    if gravity.items.count == 0 {
      animator.removeBehavior(gravity)
      animator.removeBehavior(collision)
    }
  }
}
