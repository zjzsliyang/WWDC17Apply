/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information.
 */

 // Contents.swift
 // Created by Yang Li on 26/03/2017.
 //
 // Copyright © 2017 Yang Li, Tongji University, Shanghai.
 // All rights reserved.
 //

import UIKit
import PlaygroundSupport

let CMViewController = UIViewController()
let animationView = CMAnimationView(frame: CMViewController.view.bounds)
CMViewController.view = animationView
PlaygroundPage.current.liveView = CMViewController
