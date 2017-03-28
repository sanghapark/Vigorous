//
//  Vigorous.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 18..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit


public protocol Vigorous: class {
  var animator: Animator { get }
  
}

extension Vigorous where Self: UIView {
  public func createAnimator() -> Animator {
    return Animator(self)
  }
}
