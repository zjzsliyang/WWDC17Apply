//
//  animationView.swift
//  WWDC17
//
//  Created by Yang Li on 11/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

public class animationView: UIView {
  var earthSpeed : CGFloat = 0.0
  var rocketSpeed : CGFloat = 0.0
  public func animationView(earthSpeeds: CGFloat, rocketSpeeds: CGFloat) {
    earthSpeed = earthSpeeds
    rocketSpeed = rocketSpeeds
  }
  
  override init(frame : CGRect) {
    super.init(frame: frame)
    self.aniamationInit()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func aniamationInit() {
    self.backgroundColor = UIColor.blue
    let displayLink = CADisplayLink(target: self, selector: #selector(setNeedsDisplay(_:) ))
    displayLink.add(to: .main, forMode: .defaultRunLoopMode)
    
    let earthRocketView = EarthRocketView(frame: self.bounds)
    self.addSubview(earthRocketView)
  }
}
