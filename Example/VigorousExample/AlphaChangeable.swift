//
//  AlphaChangeable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol AlphaChangeable {}

extension AlphaChangeable where Self: UIView {
  func alpha(to: CGFloat) -> Animatable {
    return Animatable { animation, completion in
      animation {
        UIView.animate(withDuration: 0.4, animations: { self.alpha = to }) { completion($0) }
      }
    }
  }
}
