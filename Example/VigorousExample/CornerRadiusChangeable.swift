//
//  CornerRadiusChangeable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol CornerRadiusChangeable { }

extension CornerRadiusChangeable where Self: UIView {
  func cornerRadius(value: CGFloat) -> Animatable {
    return Animatable { animation, completion in
      animation {
        CATransaction.begin()
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = self.layer.cornerRadius
        animation.toValue = value
        animation.duration = 2
        CATransaction.setCompletionBlock {
          completion(true)
        }
        self.layer.add(animation, forKey: "cornerRadius")
        self.layer.cornerRadius = value
        CATransaction.commit()
      }
    }
  }
}
