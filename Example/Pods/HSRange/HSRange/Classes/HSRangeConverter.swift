//
//  HSRange.swift
//  HSRange
//
//  Created by Hitendra Solanki on 05/07/17.
//  Copyright © 2017 Hitendra Solanki. All rights reserved.
//

import Foundation

//MARK:- HSRangeConverter
public struct HSRangeConverter {
    public var range1: HSRange!
    public var range2: HSRange!
}

//MARK:- HSRangeConverter - Initializers
public extension HSRangeConverter {
  init(range1: HSRange,
       range2: HSRange) {
    self.range1 = range1
    self.range2 = range2
  }
  
  init( range1low: Double, range1high: Double,
        range2low: Double, range2high: Double) {
    self.range1 = HSRange(low: range1low, high: range1high)
    self.range2 = HSRange(low: range2low, high: range2high)
  }
}

internal extension HSRangeConverter {
  //Core logic behind conversion
  func convert(a: Double, b: Double, value: Double, c: Double, d: Double) -> Double{
    let v1 = (value - a) * (d - c);
    let v2 = v1 / (b - a)
    return v2 + c
  }
}
