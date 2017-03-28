//
//  BackgroundColorChangeable.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit
import Vigorous

protocol BackgroundColorChangeable { }


extension BackgroundColorChangeable where Self: UIView {
  func backgroundColor(_ color: UIColor) -> Animatable {
    return Animatable { animation, completion in
      animation {
        UIView.animate(withDuration: 2.0, animations: {
          self.backgroundColor = color
        }, completion: { success in
          completion(success)
        })
      }
    }
  }
}
