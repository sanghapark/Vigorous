//
//  OriginMovable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol OriginMovable { }


extension OriginMovable where Self: UIView {
  func origin(x: CGFloat, y: CGFloat) -> Animatable {
    return Animatable { animation, completion in
      animation {
        UIView.animate(withDuration: 2, animations: {
          self.frame.origin.x = x
          self.frame.origin.y = y
        }, completion: { success in
          completion(success)
        })
      }
    }
  }
}
