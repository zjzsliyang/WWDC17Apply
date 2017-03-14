//
//  EarthRocketView.swift
//  WWDC17
//
//  Created by Yang Li on 11/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

public class EarthRocketView: UIView {
  var earthAngle: Double = 0.0
  var angle: Double = 10.0
  var imageViewRocket: UIImageView!
  var imageViewEarth: UIImageView!
  var imageViewMoon: UIImageView!
  var imageArray : NSMutableArray = []
  var value : NSInteger = 1
  
  var earthSpeed : CGFloat = 1.0
  var rocketSpeed : CGFloat = 2.0
  
  override init(frame : CGRect) {
    super.init(frame: frame)
    earthSpeed = 1.0
    rocketSpeed = 2.0
    value = 1
    self.backgroundColor = UIColor.clear
    imageArray = NSMutableArray.init()
    
    imageViewEarth = UIImageView.init(frame: CGRect(x: 31, y: 160, width: 260, height: 260))
    imageViewEarth.image = UIImage.init(named: "earth")
    self.addSubview(imageViewEarth)
    
    imageViewMoon = UIImageView.init(frame: CGRect(x: 100, y: 500, width: 100, height: 100))
    imageViewMoon.image = UIImage.init(named: "moon")
    self.addSubview(imageViewMoon)
    
    imageViewRocket = UIImageView.init(frame: CGRect(x: 150, y: 260, width: 30, height: 60))
    self.addSubview(imageViewRocket)
    imageViewRocket.image = UIImage.init(named: "afire2")
    
    self.startAnimationRocket()
    self.startAnimationEarth()
    self.startAnimationMoon()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func startAnimationMoon() {
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimationRocket))
    
    imageViewMoon.transform = CGAffineTransform(rotationAngle: CGFloat(angle * (Double.pi / 180.0)))
    imageViewMoon.layer.anchorPoint = CGPoint(x: 5, y: 0.5)
    UIView.commitAnimations()
  }
  
  func startAnimationRocket() {
    if value >= 3 {
      value = 1
    }
    let imageName = "afire" + String(value)
    imageViewRocket.image = UIImage.init(named: imageName)
    value = value + 1
    
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(0.1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimationRocket))
    
    imageViewRocket.transform = CGAffineTransform(rotationAngle: CGFloat(angle * (Double.pi / 180.0)))
    imageViewRocket.layer.anchorPoint = CGPoint(x: 5, y: 0.5)
    UIView.commitAnimations()
  }
  
  func endAnimationRocket() {
    angle = angle + Double(5 * rocketSpeed)
    self.startAnimationRocket()
  }
  
  func startAnimationEarth() {
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(0.1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimationEarth))
    
    imageViewEarth.transform = CGAffineTransform(rotationAngle: CGFloat(earthAngle * (Double.pi / -180.0)))
    imageViewMoon.transform = CGAffineTransform(rotationAngle: CGFloat(earthAngle * (Double.pi / 180.0)))
    UIView.commitAnimations()
  }
  
  func endAnimationEarth() {
    earthAngle = earthAngle + Double(5 * earthSpeed)
    self.startAnimationEarth()
  }
}
