//
//  HSVerticleCenterSlider.swift
//  HSCenterSlider
//
//  Created by Hitendra on 05/04/19.
//

import Foundation

public class HSVerticleCenterSlider: HSCenterSlider {
  override var maxDimentionValue: Double {
    return self.bounds.size.height.double
  }
}
