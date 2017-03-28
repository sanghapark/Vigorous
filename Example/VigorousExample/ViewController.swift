//
//  ViewController.swift
//  VigorousExample
//
//  Created by ParkSangHa on 2017. 3. 28..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import UIKit
import Vigorous

class TestView: UIView, Vigorous {
  lazy var animator: Animator = {
    return Animator(self)
  }()
}

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

