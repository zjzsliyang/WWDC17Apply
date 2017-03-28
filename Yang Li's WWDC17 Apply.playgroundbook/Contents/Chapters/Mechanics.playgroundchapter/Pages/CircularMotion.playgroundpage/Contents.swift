//#-hidden-code
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

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

var rocketSpeed: CGFloat = 2.0

func launchRocket() {
  
}

//#-end-hidden-code
/*:
 **Goal:** Launch the rocket🚀 and make it turn around the earth🌏.
 
 Remember the [cosmic velocity](glossary://cosmicVelocity).
 
 There is a related history for your reference: **Newton's cannonball**
 
 *Newton's cannonball was a thought experiment Isaac Newton used to hypothesize that the force of gravity was universal, and it was the key force for planetary motion. It appeared in his book(A Treatise of the System of the World).*
 
 Some data(approximately) is shown as follows:
 
 * callout(Gravitational acceleration & Earth radius):
    *g = 10 m/s*
 
    *R = 6241 km*

 
 You may use the function:
 
 * callout(calculate the square root):
    `sqrt()`
 
 1. Calculate the rocket speed(km/s) to make it turn around the earth, just the value and the formula with number can both OK👌!
 
 2. Fire🔥 with the function `launchRocket()` !
 
 */

rocketSpeed = /*#-editable-code*/0.0/*#-end-editable-code*/

launchRocket()
