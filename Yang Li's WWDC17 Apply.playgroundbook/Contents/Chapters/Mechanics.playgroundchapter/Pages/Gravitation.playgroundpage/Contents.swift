/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information.
 */

 // Contents.swift
 // Created by Yang Li on 13/03/2017.
 //
 // Copyright © 2017 Yang Li, Tongji University, Shanghai.
 // All rights reserved.
 //

import UIKit
import PlaygroundSupport

let viewController = UIViewController()
let animationView = AnimationView(frame: viewController.view.bounds)
viewController.view = animationView
PlaygroundPage.current.liveView = viewController

viewController.view.addSubview(animationView)
animationView.animationSpeed(earthSpeeds: 1.0, rocketSpeeds: 2.0)
