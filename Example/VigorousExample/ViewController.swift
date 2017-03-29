//
//  ViewController.swift
//  VigorousExample
//
//  Created by ParkSangHa on 2017. 3. 28..
//  Copyright © 2017년 sanghapark1021. All rights reserved.
//

import UIKit
import Vigorous

class ViewController: UIViewController {

  @IBOutlet weak var testView: TestView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  @IBAction func onStart(_ sender: Any) {
    testView.animate()
  }

}

