//
//  Animator.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 21..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation

protocol AnimatableDelegate {
  func completion(with success: Bool)
}

public class Animatable {
  
  public typealias Completion = (Bool) -> ()
  public typealias Animation = () -> ()
  
  var delegate: AnimatableDelegate?
  var animation: Animation!
  
  private init() {}
  
  @discardableResult
  public init( animation: ((@escaping Animation)->(), @escaping Completion) -> () ) {
    animation({ (animationBlock: @escaping Animation) in
      self.animation = animationBlock
    }, { [weak self] success in
      guard let strongSelf = self else { return }
      strongSelf.completion(success: success)
    })
  }
  
  func animate() {
    self.animation()
  }
  
  func completion(success: Bool) {
    self.delegate?.completion(with: success)
  }
}
