//
//  CMViewController.swift
//  WWDC17Apply
//
//  Created by Yang Li on 19/03/2017.
//  Copyright © 2017 Yang Li. All rights reserved.
//

import UIKit

class CMViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let backgroundView = UIImageView(frame: self.view.bounds)
    backgroundView.image = UIImage(named: "sky")
    backgroundView.contentMode = .scaleAspectFill
    self.view.addSubview(backgroundView)
    
    let animationView = CMAnimationView(frame: self.view.bounds)
    self.view.addSubview(animationView)
  }
  
}

