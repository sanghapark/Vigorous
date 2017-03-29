//
//  AnimatableExtension.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit

public class Animator {
  
  public typealias Completion = (Bool) -> ()
  
  private let view: UIView
  
  private var animationQueue = OperationQueue()
  
  fileprivate var delaying = false

  lazy var completions = [String: Completion]()
  
//  lazy var opWithCompletion = [String: ([Animatable], Completion?)]
  
  public init(_ view: UIView) {
    self.view = view
    animationQueue.maxConcurrentOperationCount = 1
    animationQueue.qualityOfService = .userInteractive
  }
  
  
  
  @discardableResult
  public func series(name: String? = nil, _ animatables: [Animatable], completion: Completion? = nil) -> Self {
    let unwrappedName = name ?? UUID().uuidString
    for animatable in animatables {
      let op = AnimatableOperation(animatable: animatable)
      op.name = unwrappedName
      op.delegate = self as Animator
      if completion != nil {
        completions[op.name!] = completion
      }
      self.animationQueue.addOperation(op)
    }
    return self
  }
  
  @discardableResult
  public func series(name: String? = nil, _ animatable: Animatable, completion: Completion? = nil) -> Self {
    let op = AnimatableOperation(animatable: animatable)
    op.name = name ?? UUID().uuidString
    op.delegate = self as Animator
    if completion != nil {
      completions[op.name!] = completion
    }
    self.animationQueue.addOperation(op)
    return self
  }
  
  @discardableResult
  public func parallel(name: String? = nil, _ animatables: [Animatable], completion: Completion? = nil) -> Self {
    let op = AnimatableOperation(animatables: animatables)
    op.name = name ?? UUID().uuidString
    op.delegate = self as Animator
    if completion != nil {
      completions[op.name!] = completion
    }
    self.animationQueue.addOperation(op)
    return self
  }
  

  
  @discardableResult
  public func delay(name: String? = nil, for time: TimeInterval, completion: Completion? = nil) -> Self {
    let op = DelayOperation(delayTime: time)
    op.name = name ?? UUID().uuidString
    op.delegate = self as Animator
    if completion != nil {
      completions[op.name!] = completion
    }
    self.animationQueue.addOperation(op)
    return self
  }
  
  public func cancelAll() {
    self.view.layer.removeAllAnimations()
    animationQueue.cancelAllOperations()
  }
  
  public func cancel(name: String) {
    animationQueue.operations.filter { $0.name == name }.forEach { $0.cancel() }
  }
  
  @discardableResult
  public func pause() -> Bool {
    guard !delaying else { return false }
    let pausedTime: CFTimeInterval = view.layer.convertTime(CACurrentMediaTime(), from: nil)
    view.layer.speed = 0.0
    view.layer.timeOffset = pausedTime
    return true
  }
  
  @discardableResult
  public func resume() -> Bool {
    guard !delaying else { return false }
    let pausedTime: CFTimeInterval = view.layer.timeOffset
    view.layer.speed = 1.0
    view.layer.timeOffset = 0.0
    view.layer.beginTime = 0.0
    let timeSincePause: CFTimeInterval = view.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
    view.layer.beginTime = timeSincePause
    return true
  }
  
  @discardableResult
  public func `repeat`(for count: Int = 0, body: (Animator) ->()) -> Self {
    guard count > 0 else { return self }
    
    return self
  }
  
  @discardableResult
  public func `repeat`(for count: Int = 0) -> Self {
    
    return self
  }
}


extension Animator: AnimatableOperationDelegate {
  func didFinishAnimator(name: String, success: Bool) {
    self.completions[name]?(success)
  }
}

extension Animator: DelayOperationDelegate {
  
  func didStartDelay(name: String) {
    self.delaying = true
  }
  
  func didFinishDelay(name: String, success: Bool) {
    self.delaying = false
    self.completions[name]?(success)
  }
}

