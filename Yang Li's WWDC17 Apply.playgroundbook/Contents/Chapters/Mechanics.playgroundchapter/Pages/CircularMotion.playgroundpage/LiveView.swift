//
//  LiveView.swift
//
//  Copyright © 2016,2017 Apple Inc. All rights reserved.
//

import PlaygroundSupport
import UIKit

let CMViewController = UIViewController()
let animationView = CMAnimationView(frame: CMViewController.view.bounds)
CMViewController.view = animationView
PlaygroundPage.current.liveView = CMViewController
