// CMViewController.swift
// Created by Yang Li on 29/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit
import PlaygroundSupport

public class CMViewController: UIViewController {
  let maxScaleLimit: CGFloat = 2.0
  let minScaleLimit: CGFloat = 0.5
  var animationViewCumulativeScale: CGFloat = 1.0
  let animationView = CMAnimationView()
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    let backgroundView = UIImageView(frame: self.view.bounds)
    backgroundView.image = UIImage(named: "sky.jpg")
    backgroundView.contentMode = .scaleAspectFill
    self.view.addSubview(backgroundView)
    
    let pinchGesture = UIPinchGestureRecognizer(target: self,
                                                action: #selector(zoom(gestureRecognizer:)))
    animationView.addGestureRecognizer(pinchGesture)
    
    let panGesture = UIPanGestureRecognizer(target: self,
                                            action: #selector(pan(gestureRecognizer:)))
    view.addGestureRecognizer(panGesture)
    
    animationView.frame = self.view.bounds
    self.view.addSubview(animationView)
  }
  
  func zoom(gestureRecognizer: UIPinchGestureRecognizer) {
    if gestureRecognizer.state == .changed || gestureRecognizer.state == .ended {
      if animationViewCumulativeScale > minScaleLimit && animationViewCumulativeScale < maxScaleLimit {
        animationViewCumulativeScale *= gestureRecognizer.scale
        animationView.transform = animationView.transform.scaledBy(x: gestureRecognizer.scale,
                                                                   y: gestureRecognizer.scale);
      } else {
        let nextScale = animationViewCumulativeScale * gestureRecognizer.scale
        if animationViewCumulativeScale < minScaleLimit && nextScale > minScaleLimit
          || animationViewCumulativeScale > maxScaleLimit && nextScale < maxScaleLimit {
          animationViewCumulativeScale *= gestureRecognizer.scale
          animationView.transform = animationView.transform.scaledBy(x: gestureRecognizer.scale,
                                                                     y: gestureRecognizer.scale);
        }
      }
    }
    gestureRecognizer.scale = 1;
  }
  
  func pan(gestureRecognizer: UIPanGestureRecognizer) {
    let translation = gestureRecognizer.translation(in: view)
    animationView.center = CGPoint(x: animationView.center.x + translation.x,
                                y: animationView.center.y + translation.y)
    gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: view)
  }

}

extension CMViewController: PlaygroundLiveViewMessageHandler {
  public func receive(_ message: PlaygroundValue) {
    animationView.launchingRocket2()
  }
}
