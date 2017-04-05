//
//  TestView.swift
//  VigorousExample
//
//  Created by ParkSangHa on 2017. 3. 29..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import UIKit
import Vigorous

class TestView: UIView, Vigorously, CornerRadiusChangeable {
  
  lazy var vigorous: Vigorous = {
    return Vigorous(self)
  }()
  
  func animate() {
    vigorous.animate(
      Animator()
        .serial(Animatable(3) { self.backgroundColor = .blue })
        .parallel([
          Animatable(2) { self.backgroundColor = .red },
          cornerRadius(value: frame.height / 2),
          Animatable(2) { self.center.x += 200 }
        ])
        .serial(Animatable(1) { self.center.x -= 200 })
        .serial(cornerRadius(value: 0)) { _ in
          self.animate()
        }
    )
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 20) { 
      self.vigorous
        .cancelAll()
        .animate(Animatable(3) { self.backgroundColor = .yellow })
    }
  }

  
}
