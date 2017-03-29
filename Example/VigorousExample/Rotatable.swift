//
//  Rotatable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol Rotatable { }

extension Rotatable where Self: UIView {
  func rotate() -> Animatable {
    return Animatable { animation, completion in
      animation {
        CATransaction.begin()
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 2
        rotateAnimation.repeatCount = 2
        CATransaction.setCompletionBlock {
          completion(true)
        }
        self.layer.add(rotateAnimation, forKey: "rotate")
        CATransaction.commit()
      }
    }
  }
  
  func infiniteRotate() -> Animatable {
    return Animatable { animation, completion in
      animation {
        CATransaction.begin()
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 2
        rotateAnimation.repeatCount=Float.infinity
        CATransaction.setCompletionBlock {
          completion(true)
        }
        self.layer.add(rotateAnimation, forKey: "rotate")
        CATransaction.commit()
      }
    }
  }
}
