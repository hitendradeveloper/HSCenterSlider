//
//  HSCenterSliderDelegate.swift
//  HSCenterSlider
//
//  Created by Hitendra Solanki on 04/17/2018.
//  Copyright (c) 2018 Hitendra Solanki. All rights reserved.
//

import Foundation

//MARK: HSCenterSliderDelegate Protocol
// This protocol used to provide update progress value changes to outside world
public protocol HSCenterSliderDelegate: AnyObject {
  func centerSlider(slider: HSCenterSlider, didChange value: Double)
}


//MARK: HSCenterSlidableUI Protocol
// This protocol used to provide UI releated elements which required after calculation to update
internal protocol HSCenterSlidableUI {
  var firstHalfProgressView: UIView!  {get set}
  var secondHalfProgressView: UIView! {get set}
  
  var constaintThumbCenterDimentionValue: NSLayoutConstraint!  {get set}
  
  var constrintFirstHalfProgressDimentionValue: NSLayoutConstraint!   {get set}
  var constrintSecondHalfProgressDimentionValue: NSLayoutConstraint!  {get set}
}


//MARK: HSCenterSlidableValue Protocol
// This protocol used to provide values which required during calcuation
// Without implmementing this protocol in subclass of HSCenterSlider, app will crashed forcefully
public protocol HSCenterSlidableValue: AnyObject {

  //use height for Verticle Slider, width for Horizontal slider
  var maxDimentionValue: Double { get }
  
  //possible values = horizontal, verticle
  var sliderType: HSCenterSlider.SliderType { get }
  
}
