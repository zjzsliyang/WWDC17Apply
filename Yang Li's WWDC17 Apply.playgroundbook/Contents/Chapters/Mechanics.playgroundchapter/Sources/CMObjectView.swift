// CMObjectView.swift
// Created by Yang Li on 13/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit

public class CMObjectView: UIView {
  var earthAngle: Double = 0.0
  var rocketAngle: Double = 10.0
  var moonAngle: Double = 10.0
  
  var earthSpeed: CGFloat = 1.0
  var rocketSpeed: CGFloat = 2.0
  var moonSpeed: CGFloat = 1.0
  
  var earthImageView: UIImageView!
  var rocketImageView: UIImageView!
  var moonImageView: UIImageView!
  
  var imageArray: NSMutableArray = []
  var rocketCount: NSInteger = 1
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    earthSpeed = 1.0
    rocketSpeed = 2.0
    moonSpeed = 1.0
    rocketCount = 1
    self.backgroundColor = UIColor.clear
    imageArray = NSMutableArray.init()
    
    earthImageView = UIImageView.init(frame: CGRect(x: 31, y: 160, width: 260, height: 260))
    earthImageView.image = UIImage.init(named: "earth")
    self.addSubview(earthImageView)
    
    rocketImageView = UIImageView.init(frame: CGRect(x: 150, y: 260, width: 30, height: 60))
    rocketImageView.image = UIImage.init(named: "rocket1")
    self.addSubview(rocketImageView)
    
    moonImageView = UIImageView.init(frame: CGRect(x: 100, y: 500, width: 100, height: 100))
    moonImageView.image = UIImage.init(named: "moon")
    self.addSubview(moonImageView)
    
    self.startAnimationEarth()
    self.startAnimationRocket()
    self.startAnimationMoon()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func startAnimationEarth() {
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(0.1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimationEarth))
    
    earthImageView.transform = CGAffineTransform(rotationAngle: CGFloat(earthAngle * (Double.pi / -180.0)))
    UIView.commitAnimations()
  }
  
  func endAnimationEarth() {
    earthAngle = earthAngle + Double(5 * earthSpeed)
    self.startAnimationEarth()
  }
  
  func startAnimationRocket() {
    if rocketCount >= 3 {
      rocketCount = 1
    }
    let rocketImageName = "rocket" + String(rocketCount)
    rocketImageView.image = UIImage.init(named: rocketImageName)
    rocketCount = rocketCount + 1
    
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(0.1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimationRocket))
    
    rocketImageView.transform = CGAffineTransform(rotationAngle: CGFloat(rocketAngle * (Double.pi / 180.0)))
    rocketImageView.layer.anchorPoint = CGPoint(x: 5, y: 0.5)
    UIView.commitAnimations()
  }
  
  func endAnimationRocket() {
    rocketAngle = rocketAngle + Double(5 * rocketSpeed)
    self.startAnimationRocket()
  }
  
  func startAnimationMoon() {
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(0.1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimationMoon))
    
    moonImageView.transform = CGAffineTransform(rotationAngle: CGFloat(moonAngle * (Double.pi / 180.0)))
    moonImageView.layer.anchorPoint = CGPoint(x: 5, y: 0.5)
    UIView.commitAnimations()
  }
  
  func endAnimationMoon() {
    moonAngle = moonAngle + Double(5 * moonSpeed)
    self.startAnimationMoon()
  }
}
