// Ball.swift
// Created by Yang Li on 28/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit

public class Ball: UIImageView {
  public override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
    return .ellipse
  }
}
