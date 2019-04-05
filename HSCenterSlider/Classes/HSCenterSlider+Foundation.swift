//
//  HSCenterSlider+Foundation.swift
//  HSCenterSlider
//
//  Created by Hitendra Solanki on 04/17/2018.
//  Copyright (c) 2018 Hitendra Solanki. All rights reserved.
//
//  Foundation Helpers for HSCenterSlider


import Foundation


extension Double {
  var cgfloat: CGFloat {
    return CGFloat(self)
  }
}
extension CGFloat {
  var double: Double {
    return Double(self)
  }
}

public extension NSObject{
  class var className: String {
    return String(describing: self)
  }
  
  var className: String {
    return String(describing: self)
  }
}
