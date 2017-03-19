//
//  CMAnimationView.swift
//  WWDC17Apply
//
//  Created by Yang Li on 19/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

class CMAnimationView: UIView {
  func initAnimation() {
    let displayLink = CADisplayLink(target: self, selector: #selector(setNeedsDisplay(_:)))
    displayLink.add(to: .main, forMode: .defaultRunLoopMode)
    
    let celestialBodiesView = CMObjectView(frame: self.bounds)
    self.addSubview(celestialBodiesView)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initAnimation()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
