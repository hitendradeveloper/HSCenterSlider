//
//  HSCenterSliderDelegate.swift
//  HSCenterSlider
//
//  Created by Hitendra Solanki on 04/17/2018.
//  Copyright (c) 2018 Hitendra Solanki. All rights reserved.
//

import Foundation

public protocol HSCenterSliderDelegate: class {
    func centerSlider(slider: HSCenterSlider, didChange value: Double)
}
