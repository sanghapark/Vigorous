//
//  AnimatableExtension.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 20..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit

public typealias Completion = (Bool) -> ()

enum OperationType {
  case serial, parallel
}

protocol Animatorable {
  var name: String { get }
  var completion: Completion? { get }
}

struct Animation: Animatorable {
  var name: String
  var operationType: OperationType
  var animatables: [Animatable]
  var completion: Completion?
}

struct Delay: Animatorable {
  var name: String
  var completion: Completion?
  var delayTime: TimeInterval?
}

public class Animator {
  
  public typealias Completion = (Bool) -> ()

  lazy var completions = [String: Completion]()
  
  var items = [Animatorable]()
  
  public init() {}
  
  @discardableResult
  public func serial(name: String? = nil, _ animatables: [Animatable], completion: Completion? = nil) -> Self {
    let item = Animation(name: name ?? UUID().uuidString, operationType: .serial, animatables: animatables, completion: completion)
    self.items.append(item)
    return self
  }
  
  @discardableResult
  public func serial(name: String? = nil, _ animatable: Animatable, completion: Completion? = nil) -> Self {
    let item = Animation(name: name ?? UUID().uuidString, operationType: .serial, animatables: [animatable], completion: completion)
    self.items.append(item)
    return self
  }

  @discardableResult
  public func parallel(name: String? = nil, _ animatables: [Animatable], completion: Completion? = nil) -> Self {
    let item = Animation(name: name ?? UUID().uuidString, operationType: .parallel, animatables: animatables, completion: completion)
    self.items.append(item)
    return self
  }

  @discardableResult
  public func delay(name: String? = nil, for time: TimeInterval, completion: Completion? = nil) -> Self {
    let item = Delay(name: name ?? UUID().uuidString, completion: completion, delayTime: time)
    self.items.append(item)
    return self
  }

}








