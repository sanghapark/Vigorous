//
//  TestView.swift
//  VigorousExample
//
//  Created by ParkSangHa on 2017. 3. 29..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import UIKit
import Vigorous

class TestView: UIView, Vigorous, CornerRadiusChangeable {
  
  lazy var animator: Animator = {
    return Animator(self)
  }()
  
  
  func animate() {
    animator
      .series(Animatable(3) { self.backgroundColor = .blue })
      .parallel([
          Animatable(2) { self.backgroundColor = .red },
          cornerRadius(value: frame.height / 2),
          Animatable(2) { self.center.x += 200 }
        ])
      .series(Animatable(1) { self.center.x -= 200 })
      .series(cornerRadius(value: 0)) { _ in
        self.animate()
      }
  }

  
}
