//
//  HSRange.swift
//  HSRange
//
//  Created by Hitendra Solanki on 05/07/17.
//  Copyright © 2017 Hitendra Solanki. All rights reserved.
//

import Foundation

//MARK:- Backbone structure behind the scene which acts as Closed range
public struct HSRange {
    public var low: Double!
    public var high: Double!
    
    public init(low: Double, high: Double) {
        self.low = low
        self.high = high
    }
}

//MARK:- HSRange Helpers
public extension HSRange {
    //middle value of the range
    //e.g. Range(-100,100), this will return 0
    var mid: Double {
        return (self.low + self.high)/2.0
    }
    
    //this returns the value inside of range
    //e.g. Range(-100,100), if you pass -200, this will return -100
    func innerValue(value: Double) -> Double {
        return min(max(value,self.low),self.high)
    }
}
