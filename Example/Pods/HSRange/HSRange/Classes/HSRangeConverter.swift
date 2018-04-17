//
//  HSRange.swift
//  HSRange
//
//  Created by Hitendra Solanki on 05/07/17.
//  Copyright © 2017 Hitendra Solanki. All rights reserved.
//

import Foundation

//MARK:- Converter
public struct HSRangeConverter {
    public var range1: HSRange!
    public var range2: HSRange!
    
    public init(range1: HSRange, range2: HSRange) {
        self.range1 = range1
        self.range2 = range2
    }
    
    //Helper functions to convert value of range1 to range2
    public func toRange2(of value: Double) -> Double {
        let result = self.convert(a: self.range1.low!, b: self.range1.high!,
                            value: value,
                            c: self.range2.low!, d: self.range2.high!);
        return self.range2.innerValue(value: result)
    }
    
    //Helper functions to convert value of range2 to range1
    public func toRange1(of value: Double) -> Double {
        let result = self.convert(a: self.range2.low!, b: self.range2.high!,
                            value: value,
                            c: self.range1.low!, d: self.range1.high!);
        return self.range1.innerValue(value: result)
    }
    
    //Core logic behind conversion
    internal func convert(a: Double, b: Double, value: Double, c: Double, d: Double) -> Double{
        let v1 = (value - a) * (d - c);
        let v2 = v1 / (b - a)
        return v2 + c
    }
}
