//
//  EarthRocketView.swift
//  WWDC17
//
//  Created by Yang Li on 11/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

public class EarthRocketView: UIView {
  var angleEarth: Double = 0.0
  var angle: Double = 0.0
  var imageView: UIImageView!
  var imageViewEarth: UIImageView!
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
    
    imageView = UIImageView.init(frame: CGRect(x: 150, y: 260, width: 30, height: 60))
    self.addSubview(imageView)
    imageView.image = UIImage.init(named: "afire2")
    self.startAnimation()
    self.startAnimationEarth()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func startAnimation() {
    if value >= 3 {
      value = 1
    }
    let imageName = "afire" + String(value)
    imageView.image = UIImage.init(named: imageName)
    value = value + 1
    
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(0.1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimation))
    
    imageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * (Double.pi / 180.0)))
    imageView.layer.anchorPoint = CGPoint(x: 5, y: 0.5)
    UIView.commitAnimations()
  }
  
  func endAnimation() {
    angle = angle + Double(5 * rocketSpeed)
    self.startAnimation()
  }
  
  func startAnimationEarth() {
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(0.1)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(endAnimationEarth))
    
    imageViewEarth.transform = CGAffineTransform(rotationAngle: CGFloat(angleEarth * (Double.pi / -180.0)))
    UIView.commitAnimations()
  }
  
  func endAnimationEarth() {
    angleEarth = angleEarth + Double(5 * earthSpeed)
    self.startAnimationEarth()
  }
}
