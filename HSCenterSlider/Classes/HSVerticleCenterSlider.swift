//
//  HSVerticleCenterSlider.swift
//  HSCenterSlider
//
//  Created by Hitendra on 05/04/19.
//

import Foundation
import HSRange

public class HSVerticleCenterSlider: HSCenterSlider {
  
  //MARK:- Constructors
  override init() {
    super.init(frame: .zero)
    self.commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.commonInit()
  }
  
  internal func commonInit() {
    self.slidableValueDatasource = self
    super.loadNib()
    super.baseInit()
  }
}

//MARK:- Extension HSCenterSlidableValue
extension HSVerticleCenterSlider: HSCenterSlidableValue {
 
  public var maxDimentionValue: Double {
    return self.bounds.size.height.double
  }
  
  public var sliderType: HSCenterSlider.SliderType {
    return HSCenterSlider.SliderType.verticle
  }
}
