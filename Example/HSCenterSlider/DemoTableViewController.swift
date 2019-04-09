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

class DemoTableViewController: UITableViewController {
  
  @IBOutlet weak var hsHorizontalSlider1: HSHorizontalCenterSlider!
  @IBOutlet weak var hsHorizontalSlider2: HSHorizontalCenterSlider!
  @IBOutlet weak var hsHorizontalSlider3: HSHorizontalCenterSlider!
  
  @IBOutlet weak var lblSlider1Output: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.hsHorizontalSlider1.delegate = self;
    self.hsHorizontalSlider1.rangeValue = HSRange(low: -200, high: 100)
    
  }
  
  //slider 2 Actions
  @IBAction func slider2SetValueNegetive80Animated(_ sender: Any) {
    self.hsHorizontalSlider2.set(value: -80, animated: true)
  }
  
  @IBAction func slider2SetValueZeroAnimated(_ sender: Any) {
    self.hsHorizontalSlider2.set(value: 0, animated: true)
  }
  
  @IBAction func slider2SetValue85Animated(_ sender: Any) {
    self.hsHorizontalSlider2.set(value: 85, animated: true)
  }
  
  
  //slider 2 Actions
  @IBAction func slider3SetblackTintColor(_ sender: Any) {
    UIView.animate(withDuration: 0.25) {
      self.hsHorizontalSlider3.tintColor = UIColor.black
    }
  }
  
  @IBAction func slider3SetOrangeTintColor(_ sender: Any) {
    UIView.animate(withDuration: 0.25) {
      self.hsHorizontalSlider3.tintColor = UIColor.orange
    }
  }
  
  @IBAction func slider3SetDefaultTintColor(_ sender: Any) {
    UIView.animate(withDuration: 0.25) {
      //as self.view.tintColor has a default iOS tint color, similar to blue
      self.hsHorizontalSlider3.tintColor = self.view.tintColor
    }
  }
 
}

extension DemoTableViewController: HSCenterSliderDelegate {
  public func centerSlider(slider: HSCenterSlider, didChange value: Double) {
    if slider == self.hsHorizontalSlider1 {
      self.lblSlider1Output.text = String.init(format: "%.0f", arguments: [value])
    }
  }
}

