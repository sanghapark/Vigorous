//
//  AsyncOperation.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 18..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation

protocol AnimatableOperationDelegate {
  func didFinishAnimator(name: String, success: Bool)
}

class AnimatableOperation: AsyncOperation {
  
  typealias Executable = ( @escaping (_ success: Bool)->() ) -> ()
  
  var delegate: AnimatableOperationDelegate?
  
  var animatables = [Animatable]()
  var didCompleteCount = 0
  
  init(animator: Animatable) {
    self.animatables.append(animator)
  }
  
  init(animators: [Animatable]) {
    self.animatables = animators
  }
  
  override func main() {
    super.main()
    for animatable in self.animatables {
      animatable.delegate = self
      DispatchQueue.main.async {
        animatable.animate()
      }
    }
  }
  
}

extension AnimatableOperation: AnimatableDelegate {
  func completion(with success: Bool) {
    didCompleteCount += 1
    if didCompleteCount >= self.animatables.count {
      self.state = .Finished
      self.delegate?.didFinishAnimator(name: self.name!, success: success)
    }
  }
}
