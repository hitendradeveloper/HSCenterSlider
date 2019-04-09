//
//  HSCenterSlider.swift
//  HSCenterSlider
//
//  Created by Hitendra Solanki on 04/17/2018.
//  Copyright (c) 2018 Hitendra Solanki. All rights reserved.
//

import UIKit
import HSRange

public class HSCenterSlider: UIControl, HSCenterSlidableUI {
  
  //MARK:- Custom Hierarchical types
  
  //MARK:- Enum HSProgressType
  enum HSProgressType {
    case first(progress: Double)
    case second(progress: Double)
  }
  
  //MARK:- Enum SliderType
  public enum SliderType {
    case horizontal
    case verticle
  }
  
  
  //MARK:- IBOutlets
  @IBOutlet internal var contentView: UIView!
  
  @IBOutlet internal weak var thumb: UIView!
  @IBOutlet internal weak var lblProgressValue: UILabel!
  
  //HSCenterSlidable: protocol properties
  @IBOutlet internal weak var firstHalfProgressView: UIView!
  @IBOutlet internal weak var secondHalfProgressView: UIView!
  
  @IBOutlet internal weak var constaintThumbCenterDimentionValue: NSLayoutConstraint!
  
  @IBOutlet internal weak var constrintFirstHalfProgressDimentionValue: NSLayoutConstraint!
  @IBOutlet internal weak var constrintSecondHalfProgressDimentionValue: NSLayoutConstraint!
  
  //MARK:- Delegate & DataSource
  
  //datasource used to fetch vales for calculations
  public weak var slidableValueDatasource: HSCenterSlidableValue?
  
  //delegate used to update outer world, after calculations
  public weak var delegate: HSCenterSliderDelegate?
  
  //MARK:- iVars
  internal var isMovingThumb = false;
  internal let thumbHalfDementionValue: Double = 15
  
  override public var tintColor: UIColor! {
    didSet{
      super.tintColor = tintColor;
      self.firstHalfProgressView.backgroundColor = tintColor
      self.secondHalfProgressView.backgroundColor = tintColor
    }
  }
  
  public var rangeValue: HSRange?
  public var value: Double = 0.0 {
    didSet{
      self.lblProgressValue.text = String.init(format: "%.0f", arguments: [self.value])
      if self.value < self.internalSecondHalfRangeConverter!.range1.low {
        self.setProgressOnUI(progressType: HSProgressType.first(progress: (value)))
      }else{
        self.setProgressOnUI(progressType: HSProgressType.second(progress: (value)))
      }
    }
  }
  
  
  //MARK:- Constructors
  public init() {
    super.init(frame: .zero)
    self.baseInit()
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.baseInit()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.baseInit()
  }
  
  func loadNib(){
    let selfBundle = Bundle(for: HSCenterSlider.self)
    let resourceBundlePath = selfBundle.path(forResource: HSCenterSlider.className, ofType: "bundle")
    let bundle = Bundle(path: resourceBundlePath!)
    
    let className = self.slidableValueDatasource?.sliderType == SliderType.horizontal ? HSHorizontalCenterSlider.className : HSVerticleCenterSlider.className
    
    let nib : UINib = UINib(nibName: className, bundle: bundle)
    nib.instantiate(withOwner: self, options: nil)
    self.contentView.frame = self.bounds
    self.addSubview(self.contentView)
    
    self.backgroundColor = UIColor.clear
    self.contentView.backgroundColor = UIColor.clear
    
    self.thumb.backgroundColor = UIColor.white
    self.thumb.layer.cornerRadius = thumbHalfDementionValue.cgfloat
    self.thumb.layer.masksToBounds = true
    self.thumb.elevate(elevation: 2.0)
    
    self.lblProgressValue.alpha = 0.0;
    self.firstHalfProgressView.backgroundColor = tintColor
    self.secondHalfProgressView.backgroundColor = tintColor
    
    print("\(#function) \(#line)")
    self.rangeValue = HSRange(low: -100, high: 100) //default Range for the slider
    self.value = 0; //default progress value
  }
  
  func baseInit() {
    
  }
}

//MARK:- Update Progress Value
extension HSCenterSlider {
  public func set(value: Double, animated: Bool) {
    self.value = self.rangeValue!.innerValue(value: value);
    UIView.animate(withDuration: animated ? 0.25 : 0.0) {
      self.layoutIfNeeded()
    }
  }
  
  internal func setProgressOnUI(progressType: HSProgressType){
    switch progressType {
    case .first(let progress):
      let constantValue = min(
        (self.internalFirstHalfRangeConverter!.range2.high.cgfloat - self.internalFirstHalfRangeConverter!.convertToRange2(valueFromRange1: progress).cgfloat),
        (self.centerX - self.thumbHalfDementionValue).cgfloat
      )
      self.constrintSecondHalfProgressDimentionValue.constant = 0.0;
      self.constrintFirstHalfProgressDimentionValue.constant = constantValue
      self.constaintThumbCenterDimentionValue.constant = -1 * constantValue
      
    case .second(let progress):
      let constantValue = min(
        self.internalSecondHalfRangeConverter!.convertToRange2(valueFromRange1: progress).cgfloat - self.internalSecondHalfRangeConverter!.range2.low.cgfloat,
        (self.centerX - self.thumbHalfDementionValue).cgfloat
      )
      self.constrintFirstHalfProgressDimentionValue.constant = 0.0;
      self.constrintSecondHalfProgressDimentionValue.constant = constantValue
      self.constaintThumbCenterDimentionValue.constant = constantValue
    }
  }
}



//MARK:- Internal Converters
// This is used to devide full range into two ranges [FirstHalf Range and SecondHalf Range]
public extension HSCenterSlider {
  
  internal var internalRangeConverter: HSRangeConverter? {
    guard let rangeValue = rangeValue else {
      return nil;
    }
    
    guard let slidableValueDatasource = self.slidableValueDatasource else {
      assertionFailure("Hitendra Solanki: slidableValueDatasource must be set in subclass of HSCenterSlider, it must not be nil")
      return nil
    }
    
    return
      HSRangeConverter(range1: HSRange(low: rangeValue.low, high: rangeValue.high),
                       range2: HSRange(low: 0, high: slidableValueDatasource.maxDimentionValue))
  }
  
  internal var internalFirstHalfRangeConverter: HSRangeConverter? {
    guard let internalConverter = self.internalRangeConverter else {
      return nil;
    }
    
    return
      HSRangeConverter(range1: HSRange(low: internalConverter.range1.low, high: internalConverter.range1.mid),
                       range2: HSRange(low: internalConverter.convertToRange2(valueFromRange1: internalConverter.range1.low), high: internalConverter.convertToRange2(valueFromRange1: internalConverter.range1.mid))
    )
  }
  internal var internalSecondHalfRangeConverter: HSRangeConverter? {
    guard let internalConverter = self.internalRangeConverter else {
      return nil;
    }
    
    return
      HSRangeConverter(range1: HSRange(low: internalConverter.range1.mid, high: internalConverter.range1.high),
                       range2: HSRange(low: internalConverter.convertToRange2(valueFromRange1: internalConverter.range1.mid), high: internalConverter.convertToRange2(valueFromRange1: internalConverter.range1.high))
    )
  }
}
