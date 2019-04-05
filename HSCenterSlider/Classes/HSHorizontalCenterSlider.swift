//
//  HSHorizontalCenterSlider.swift
//  HSCenterSlider
//
//  Created by Hitendra on 05/04/19.
//

import Foundation

public class HSHorizontalCenterSlider: HSCenterSlider {
  override var maxDimentionValue: Double {
    return self.bounds.size.width.double
  }
  override var sliderType: HSCenterSlider.HSCenterSliderType {
    return HSCenterSliderType.horizontal
  }
}
