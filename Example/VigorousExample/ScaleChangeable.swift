//
//  ScaleChangeable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol ScaleChangeable {}

extension ScaleChangeable where Self: UIView {
  
  func scale(scaleX: CGFloat, scaleY: CGFloat) -> Animatable {
    return Animatable { animation, completion in
      animation {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { 
          self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        }, completion: { success in
          completion(success)
        })
      }
    }
  }
  
}
