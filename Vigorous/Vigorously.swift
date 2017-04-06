//
//  Vigorous.swift
//  Vigorous
//
//  Created by ParkSangHa on 2017. 4. 4..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation


public class Vigorously {
  
  typealias Completion = (Bool) -> ()
  
  fileprivate var delaying = false
  
  private let queue = OperationQueue()
  private let view: UIView
  
  lazy var completions = [String: Completion]()
  
  public init(_ view: UIView) {
    self.view = view
    queue.maxConcurrentOperationCount = 1
    queue.qualityOfService = .userInteractive
  }
  
  @discardableResult
  public func animate(_ animator: Animator, completion: (() -> Void)? = nil) -> Self {
    for item in animator.items {
      if let animation = item as? Animation {
        if animation.operationType == .serial {
          for animatable in animation.animatables {
            let op = AnimatableOperation(animatable: animatable)
            op.name = animation.name
            op.delegate = self as Vigorously
            if animation.completion != nil {
              completions[animation.name] = animation.completion
            }
            queue.addOperation(op)
          }
        } else if animation.operationType == .parallel {
          let op = AnimatableOperation(animatables: animation.animatables)
          op.name = animation.name
          op.delegate = self as Vigorously
          if animation.completion != nil {
            completions[animation.name] = animation.completion
          }
          queue.addOperation(op)
        }
      } else if let delay = item as? Delay {
        let op = DelayOperation(delayTime: delay.delayTime ?? 0)
        op.name = delay.name
        op.delegate = self as Vigorously
        if delay.completion != nil {
          completions[delay.name] = delay.completion
        }
        queue.addOperation(op)
      }
    }
    queue.operations.last?.completionBlock = completion
    return self
  }
  
  @discardableResult
  public func animate(name: String? = nil, _ animatable: Animatable, completion: ((Bool)->())? = nil) -> Self {
    let op = AnimatableOperation(animatable: animatable)
    op.name = name ?? UUID().uuidString
    op.delegate = self as Vigorously
    if completion != nil {
      completions[op.name!] = completion
    }
    queue.addOperation(op)
    return self
  }
  
  @discardableResult
  public func `repeat`(for count: Int, _ animator: Animator) -> Self {
    guard count > 0 else { return self }
    for _ in 1...count {
      animate(animator)
    }
    return self
  }
  
  @discardableResult
  public func `repeat`(for count: Int, _ animatable: Animatable) -> Self {
    guard count > 0 else { return self }
    for _ in 1...count {
      animate(animatable)
    }
    return self
  }
  
  public func repeatForever(_ animator: Animator) {
    animate(animator) { [weak self, animator] in
      guard let strongSelf = self else { return }
      strongSelf.repeatForever(animator)
    }
  }
  
  public func repeatForever(_ animatable: Animatable) {
    animate(animatable) { [weak self, animatable] _ in
      guard let strongSelf = self else { return }
      strongSelf.repeatForever(animatable)
    }
  }
  
  
  @discardableResult
  public func cancelAll() -> Self {
    self.view.layer.removeAllAnimations()
    queue.cancelAllOperations()
    return self
  }
  
  @discardableResult
  public func cancel(name: String) -> Self {
    queue.operations.filter { $0.name == name }.forEach { $0.cancel() }
    return self
  }
  
  @discardableResult
  public func pause() -> Bool {
//    guard !delaying else { return false }
    let pausedTime: CFTimeInterval = view.layer.convertTime(CACurrentMediaTime(), from: nil)
    view.layer.speed = 0.0
    view.layer.timeOffset = pausedTime
    return true
  }
  
  @discardableResult
  public func resume() -> Bool {
//    guard !delaying else { return false }
    let pausedTime: CFTimeInterval = view.layer.timeOffset
    view.layer.speed = 1.0
    view.layer.timeOffset = 0.0
    view.layer.beginTime = 0.0
    let timeSincePause: CFTimeInterval = view.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
    view.layer.beginTime = timeSincePause
    return true
  }
  
  
}

extension Vigorously: AnimatableOperationDelegate {
  func didFinishAnimator(name: String, success: Bool) {
    self.completions[name]?(success)
    self.completions.removeValue(forKey: name)
  }
}

extension Vigorously: DelayOperationDelegate {
  func didStartDelay(name: String) {
    self.delaying = true
  }
  func didFinishDelay(name: String, success: Bool) {
    self.delaying = false
    self.completions[name]?(success)
    self.completions.removeValue(forKey: name)
  }
}



















