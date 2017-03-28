//
//  Shakeable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol Shakeable { }

extension Shakeable where Self: UIView {
  func shake() -> Animatable {
    return Animatable { animation, completion in
      animation {
        CATransaction.begin()
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 1
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        CATransaction.setCompletionBlock {
          completion(true)
        }
        self.layer.add(animation, forKey: "shake")
        CATransaction.commit()
      }
    }
  }
}
