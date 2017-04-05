//
//  VigorousTests.swift
//  VigorousTests
//
//  Created by ParkSangHa on 2017. 3. 27..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import XCTest
@testable import Vigorous




class TestView: UIView, Vigorously {
  lazy var vigorous: Vigorous = { Vigorous(self) }()
}

class VigorousTests: XCTestCase {
  
  let testView = TestView()
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
