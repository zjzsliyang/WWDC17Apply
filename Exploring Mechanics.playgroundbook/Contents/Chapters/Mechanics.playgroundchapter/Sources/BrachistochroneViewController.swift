// BrachistochroneViewController.swift
// Created by Yang Li on 29/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit
import AVFoundation
import PlaygroundSupport

public class BrachistochroneViewController: UIViewController, UICollisionBehaviorDelegate {
  var audioPlayer: AVAudioPlayer!

  let pokemon = ["Abra", "Bellsprout", "Bulbasaur", "Caterpie", "Charmander", "Dratini", "Eevee", "Jigglypuff", "Mankey", "Meowth", "Mew", "Pidgey", "Pikachu", "Psyduck", "Rattata", "Snorlax", "Squirtle", "Venonat", "Weedle", "Zubat"]
  
  let backgroundView = UIImageView()
  let firstView = UIView()
  let secondView = UIView()
  let thirdView = UIView()
  let animationView = UIView()
  let firstPokemonView = UIImageView()
  let secondPokemonView = UIImageView()
  let thirdPokemonView = UIImageView()
  
  let gravity = UIGravityBehavior()
  let collision = UICollisionBehavior()
  var animator = UIDynamicAnimator()
  
  var balls = [Ball]()
  let ballSize: CGFloat = 20
  
  let xOffset: CGFloat = 50
  var yOffset: CGFloat = 50
  let xWidth: CGFloat = 270
  let yHeight: CGFloat = 368 / 3
  let gap: CGFloat = 40
  
  let maxScaleLimit: CGFloat = 20.0
  let minScaleLimit: CGFloat = 0.5
  var animationViewCumulativeScale: CGFloat = 1.0
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    let bgView = UIImageView()
    bgView.frame = self.view.bounds
    bgView.image = UIImage(named: "bg.jpg")
    bgView.contentMode = .scaleAspectFill
    self.view.addSubview(bgView)
    animationView.frame = self.view.bounds
    self.view.addSubview(animationView)
    initContainerView()
    setPokemonView()
    initPokemonView()
    yOffset = 50
    
    for index in 0..<3 {
      addBall(index: index)
      let startPoint = CGPoint(x: xOffset, y: yOffset)
      let endPoint = CGPoint(x: xOffset + xWidth, y: yOffset + yHeight)
      
      collision.addBoundary(withIdentifier: self.pathIdentifierAt(index: index) as NSCopying, for: self.pathAtIndex(index: index, startPoint: startPoint, endPoint: endPoint)!)
      collision.addBoundary(withIdentifier: self.lineIdentifierAt(index: index) as NSCopying, from: CGPoint(x: endPoint.x, y: startPoint.y), to: endPoint)
      yOffset += gap + yHeight
    }

    collision.translatesReferenceBoundsIntoBoundary = true
    collision.collisionDelegate = self
    self.animator = UIDynamicAnimator(referenceView: self.view)
    
    playBgMusic()
  }
  
  override public func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    startAnimation()
//    let pinchGesture = UIPinchGestureRecognizer(target: self,
//                                                action: #selector(zoom(gestureRecognizer:)))
//    animationView.addGestureRecognizer(pinchGesture)
//    
//    let panGesture = UIPanGestureRecognizer(target: self,
//                                            action: #selector(pan(gestureRecognizer:)))
//    animationView.addGestureRecognizer(panGesture)
  }
  
  func startAnimation() {
    for (index, ball) in balls.enumerated() {
      ball.center = self.ballPositionAtIndex(index: index)
      self.gravity.addItem(ball)
      self.collision.addItem(ball)
    }
    self.animator.addBehavior(gravity)
    self.animator.addBehavior(collision)
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
  
  func pathIdentifierAt(index: Int) -> NSCopying {
    return ("BeziperPath" + "\(index)") as NSCopying
  }
  func lineIdentifierAt(index: Int) -> NSCopying {
    return ("VerticalLine" + "\(index)") as NSCopying
  }
  
  func ballPositionAtIndex(index: Int) -> CGPoint {
    var point = CGPoint(x: xOffset + ballSize / 2, y: CGFloat(index) * (yHeight + gap) + 50)
    if index == 0 {
      point.y -= 7
    }
    return point
  }
  
  func pathAtIndex(index: Int, startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath? {
    switch index {
    case 0:
      return self.straightPath(startPoint: startPoint, endPoint: endPoint)
    case 1:
      return self.curvePath1(startPoint: startPoint, endPoint: endPoint)
    case 2:
      return self.curvePath2(startPoint: startPoint, endPoint: endPoint)
    default:
      print("INDEX ERROR")
      return nil
    }
  }
  
  public func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
    let ball = item as! Ball
    let index = balls.index(of: ball)
    if identifier as! String == self.lineIdentifierAt(index: index!) as! String {
      self.gravity.removeItem(item)
      self.collision.removeItem(ball)
      if self.gravity.items.count == 0 {
        self.animator.removeBehavior(gravity)
        self.animator.removeBehavior(collision)
      }
    }
  }
  
  func straightPath(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: startPoint)
    bezierPath.addLine(to: endPoint)
    addShapeLayerWithPath(path: bezierPath)
    return bezierPath
  }
  
  func curvePath1(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: startPoint)
    bezierPath.addQuadCurve(to: endPoint, controlPoint: CGPoint(x: xOffset + 50.0, y: endPoint.y))
    bezierPath.addQuadCurve(to: startPoint, controlPoint: CGPoint(x: xOffset + 50.0, y: endPoint.y))
    addShapeLayerWithPath(path: bezierPath)
    return bezierPath
  }
  
  func curvePath2(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: startPoint)
    bezierPath.addCurve(to: endPoint, controlPoint1: CGPoint(x: xOffset + 5.0, y: endPoint.y - 5.0), controlPoint2: CGPoint(x: xOffset + 15.0, y: endPoint.y))
    bezierPath.addCurve(to: startPoint, controlPoint1: CGPoint(x: xOffset + 15.0, y: endPoint.y), controlPoint2: CGPoint(x: xOffset + 5.0, y: endPoint.y - 5))
    addShapeLayerWithPath(path: bezierPath)
    return bezierPath
  }
  
  func addShapeLayerWithPath(path: UIBezierPath) {
    let pathLayer = CAShapeLayer()
    pathLayer.path = path.cgPath
    pathLayer.fillColor = UIColor.clear.cgColor
    pathLayer.strokeColor = UIColor.gray.cgColor
    pathLayer.lineWidth = 2.0
    animationView.layer.addSublayer(pathLayer)
  }
  
  public func initContainerView() {
    backgroundView.frame = CGRect(x: -29, y: -60, width: 453, height: 911)
    backgroundView.image = UIImage(named: "GameBoy")
    animationView.addSubview(backgroundView)
    
    firstView.frame = CGRect(x: 40, y: 34, width: 340, height: 143)
    self.firstView.layer.borderWidth = 2.0
    self.firstView.layer.borderColor = UIColor.gray.cgColor
    animationView.addSubview(firstView)
    
    self.secondView.frame = CGRect(x: 40, y: 197, width: 340, height: 143)
    self.secondView.layer.borderWidth = 2.0
    self.secondView.layer.borderColor = UIColor.gray.cgColor
    animationView.addSubview(secondView)
    
    self.thirdView.frame = CGRect(x: 40, y: 365, width: 340, height: 143)
    self.thirdView.layer.borderWidth = 2.0
    self.thirdView.layer.borderColor = UIColor.gray.cgColor
    animationView.addSubview(thirdView)
  }
  
  public func initPokemonView() {
    firstPokemonView.frame = CGRect(x: 40 + 295, y: 34 + 143 - 40, width: 40, height: 40)
    firstPokemonView.contentMode = .scaleAspectFill
    animationView.addSubview(firstPokemonView)
    
    secondPokemonView.frame = CGRect(x: 40 + 295, y: 34 + 143 * 2 - 20, width: 40, height: 40)
    secondPokemonView.contentMode = .scaleAspectFill
    animationView.addSubview(secondPokemonView)
    
    thirdPokemonView.frame = CGRect(x: 40 + 295, y: 34 + 143 * 3, width: 40, height: 40)
    thirdPokemonView.contentMode = .scaleAspectFill
    animationView.addSubview(thirdPokemonView)
  }
  
  public func setPokemonView(first: String = "Bulbasaur", second: String = "Pikachu", third: String = "Charmander") {
    firstPokemonView.image = UIImage(named: first)
    secondPokemonView.image = UIImage(named: second)
    thirdPokemonView.image = UIImage(named: third)
  }
  
  public func randomPokemon() {
    setPokemonView(first: pokemon[Int(arc4random() % 20)], second: pokemon[Int(arc4random() % 20)], third: pokemon[Int(arc4random() % 20)])
  }
  
  public func addBall(index: Int) {
    let ball = Ball(image: UIImage(named: "PokeBall.png"))
    ball.frame = CGRect(x: 0, y: 0, width: ballSize, height: ballSize)
    ball.contentMode = .scaleAspectFill
    animationView.addSubview(ball)
    self.balls.append(ball)
  }
  
  func playBgMusic() {
    let musicPath = Bundle.main.path(forResource: "bgm2", ofType: "mp3")
    let url = URL(fileURLWithPath: musicPath!)
    try! audioPlayer = AVAudioPlayer(contentsOf: url)
    audioPlayer.numberOfLoops = -1
    audioPlayer.volume = 1
    audioPlayer.prepareToPlay()
    audioPlayer.play()
  }
}

extension BrachistochroneViewController: PlaygroundLiveViewMessageHandler {
  public func receive(_ message: PlaygroundValue) {
    switch message {
    case .boolean:
      initPokemonView()
      startAnimation()
    case .string:
      randomPokemon()
      initPokemonView()
      startAnimation()
    default:
      print("other message error")
    }
  }
}
