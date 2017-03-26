// CMAnimationView.swift
// Created by Yang Li on 13/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit

public class CMAnimationView: UIView {
  
  public override init(frame : CGRect) {
    super.init(frame: frame)
    self.initAnimation()
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func initAnimation() {
    let backgroundView = UIImageView(frame: self.bounds)
    backgroundView.image = UIImage(named: "sky.jpg")
    self.addSubview(backgroundView)
    
    let displayLink = CADisplayLink(target: self, selector: #selector(setNeedsDisplay(_:) ))
    displayLink.add(to: .main, forMode: .defaultRunLoopMode)

    let celestialBodiesView = CMObjectView(frame: self.bounds)
    self.addSubview(celestialBodiesView)
  }
}
