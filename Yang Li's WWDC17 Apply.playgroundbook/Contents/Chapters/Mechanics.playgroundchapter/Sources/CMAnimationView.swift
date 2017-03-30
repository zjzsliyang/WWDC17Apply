// CMAnimationView.swift
// Created by Yang Li on 13/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit

public class CMAnimationView: UIView {
  let celestialBodiesView = CMObjectView()
  
  public override init(frame : CGRect) {
    super.init(frame: frame)
    self.initAnimation()
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func initAnimation() {
    let displayLink = CADisplayLink(target: self, selector: #selector(setNeedsDisplay(_:) ))
    displayLink.add(to: .main, forMode: .defaultRunLoopMode)

    celestialBodiesView.frame = self.bounds
    self.addSubview(celestialBodiesView)
  }
  
  public func launchingRocket2() {
    celestialBodiesView.launchingRocket()
  }
}
