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

class ViewController: UIViewController {

//    @IBOutlet weak var hsDoubleSlider: HSHorizontalCenterSlider!
    @IBOutlet weak var hsVertileCenterSlider: HSVerticleCenterSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.hsDoubleSlider.delegate = self
//        self.hsDoubleSlider.tintColor = self.view.tintColor
//        self.hsDoubleSlider.rangeValue = HSRange(low: -100, high: 100)
      
        self.hsVertileCenterSlider.delegate = self
        self.hsVertileCenterSlider.tintColor = self.view.tintColor
        self.hsVertileCenterSlider.rangeValue = HSRange(low: -100, high: 100)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_50DidTap(_ sender: Any) {
       // self.hsDoubleSlider.value = -50;
      //self.hsVertileCenterSlider.value = -50;
    }
    
    @IBAction func btn0DidTap(_ sender: Any) {
        //self.hsDoubleSlider.value = 0;
      //self.hsVertileCenterSlider.value = 0;
    }
    
    @IBAction func btn50DidTap(_ sender: Any) {
      //  self.hsDoubleSlider.value = 50;
      //self.hsVertileCenterSlider.value = 50;
    }
    
    @IBAction func btn80AnimatedDidtap(_ sender: Any) {
      //  self.hsDoubleSlider.set(value: 80, animated: true)
      //self.hsVertileCenterSlider.set(value: 80, animated: true)
    }
    
    @IBAction func btn_80AnimatedDidtap(_ sender: Any) {
      //  self.hsDoubleSlider.set(value: -80, animated: true)
      //self.hsVertileCenterSlider.set(value: -80, animated: true)
    }
}

extension ViewController: HSCenterSliderDelegate {
    public func centerSlider(slider: HSCenterSlider, didChange value: Double) {
        print("HSCenterSlider := value change with floating points := \(value)")
        print("HSCenterSlider := value change without floating points := \(String.init(format: "%.0f", arguments: [value]))")  
    }
}

