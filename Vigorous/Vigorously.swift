//
//  Vigorously.swift
//  FeedableTest
//
//  Created by ParkSangHa on 2017. 3. 18..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import Foundation
import UIKit


public protocol Vigorously: class {
  var vigorous: Vigorous { get }
  
}

extension Vigorously where Self: UIView { }
