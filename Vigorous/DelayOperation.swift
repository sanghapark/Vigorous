//
//  DelayOperation.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 21..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation

protocol DelayOperationDelegate {
  func didStartDelay(name: String)
  func didFinishDelay(name: String, success: Bool)
}

class DelayOperation: AsyncOperation {
  
  var delayTime: TimeInterval
  
  var delegate: DelayOperationDelegate?
  
  init(delayTime: TimeInterval) {
    self.delayTime = delayTime
    super.init()
  }
  
  override func main() {
    self.delegate?.didStartDelay(name: self.name!)
    DispatchQueue.global().asyncAfter(deadline: .now() + delayTime) { [unowned self] in
      self.state = .Finished
      self.delegate?.didFinishDelay(name: self.name!, success: true)
    }
  }
}
