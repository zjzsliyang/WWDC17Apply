// CMViewController.swift
// Created by Yang Li on 29/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation
import PlaygroundSupport

public class CMViewController: UIViewController, CLLocationManagerDelegate {
  var audioPlayer: AVAudioPlayer!
  var locationManager = CLLocationManager()
  
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

  func playBgMusic() {
    let musicPath = Bundle.main.path(forResource: "bgm", ofType: "mp3")
    let url = URL(fileURLWithPath: musicPath!)
    try! audioPlayer = AVAudioPlayer(contentsOf: url)
    audioPlayer.numberOfLoops = 0
    audioPlayer.volume = 1
    audioPlayer.prepareToPlay()
    audioPlayer.play()
  }
  
  func loadLocation() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location: CLLocation = locations[locations.count - 1]
    var currLocation = locations.last!
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(currLocation) { (placemark, error) in
      if error == nil {
        let array = placemark! as NSArray
        let mark = array.firstObject as! CLPlacemark
        var city: String = (mark.addressDictionary! as NSDictionary).value(forKey: "City") as! String
      }
    }
  }
}

extension CMViewController: PlaygroundLiveViewMessageHandler {
  public func receive(_ message: PlaygroundValue) {
    animationView.launchingRocket2()
    loadLocation()
    playBgMusic()
  }
}
