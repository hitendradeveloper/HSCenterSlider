//
//  HSHorizontalCenterSlider.swift
//  HSCenterSlider
//
//  Created by Hitendra on 05/04/19.
//

import Foundation
import HSRange

public class HSHorizontalCenterSlider: HSCenterSlider {
  
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
  
  func commonInit() {
    self.slidableValueDatasource = self
    super.loadNib()
    super.baseInit()
  }
}

//MARK:- Extension HSCenterSlidableValue
extension HSHorizontalCenterSlider: HSCenterSlidableValue {
  
  public var maxDimentionValue: Double {
    return self.bounds.size.width.double
  }
  
  public var sliderType: HSCenterSlider.SliderType {
    return HSCenterSlider.SliderType.horizontal
  }
}
