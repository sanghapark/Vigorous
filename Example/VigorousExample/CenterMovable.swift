//
//  CenterMovable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol CenterMovable { }


extension CenterMovable where Self: UIView {
  func center(x: CGFloat, y: CGFloat) -> Animatable {
    return Animatable { animation, completion in
      animation {
        UIView.animate(withDuration: 2, animations: {
          self.center.x = x
          self.center.y = y
        }, completion: { success in
          completion(success)
        })
      }
    }
  }
}
