//
//  ViewController.swift
//  Double ended Slider Demo
//
//  Created by SOTSYS216 on 09/04/18.
//  Copyright © 2018 SOTSYS216. All rights reserved.
//

import UIKit
import HSCenterSlider
import HSRange

class DemoTableViewController: UIViewController {
  
  @IBOutlet weak var hsHorizontalSlider: HSHorizontalCenterSlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
 
}

extension ViewController: HSCenterSliderDelegate {
  public func centerSlider(slider: HSCenterSlider, didChange value: Double) {
    print("HSCenterSlider := value change without floating points := \(String.init(format: "%.0f", arguments: [value]))")
  }
}

