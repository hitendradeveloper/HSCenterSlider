//
//  HSCenterSlider.swift
//  HSCenterSlider
//
//  Created by Hitendra Solanki on 04/17/2018.
//  Copyright (c) 2018 Hitendra Solanki. All rights reserved.
//

import UIKit
import HSRange

private protocol HSCenterSlidableUI {
  var firstHalfProgressView: UIView!  {get set}
  var secondHalfProgressView: UIView! {get set}
  
  var constaintThumbCenterValue: NSLayoutConstraint!  {get set}
 
  var constrintFirstHalfProgressWidth: NSLayoutConstraint!   {get set}
  var constrintSecondHalfProgressWidth: NSLayoutConstraint!  {get set}
}

private protocol HSCenterSlidableValue {
  var maxDimentionValue: Double { get }
}

public class HSCenterSlider: UIControl, HSCenterSlidableUI {
  
    enum HSProgressType {
        case first(progress: Double)
        case second(progress: Double)
    }
    
    //MARK:- Delegate
    public weak var delegate: HSCenterSliderDelegate?
    
    //MARK:- IBOutlets
    @IBOutlet private var contentView: UIView!

    @IBOutlet internal weak var thumb: UIView!
    @IBOutlet internal weak var lblProgressValue: UILabel!
  
  //HSCenterSlidable: protocol properties
  @IBOutlet fileprivate weak var firstHalfProgressView: UIView!
  @IBOutlet fileprivate weak var secondHalfProgressView: UIView!
  
  @IBOutlet internal weak var constaintThumbCenterValue: NSLayoutConstraint!
  
  @IBOutlet internal weak var constrintFirstHalfProgressWidth: NSLayoutConstraint!
  @IBOutlet internal weak var constrintSecondHalfProgressWidth: NSLayoutConstraint!
  
  //HSCenterSlidableValue: protocol properties
  var maxDimentionValue: Double {
    assertionFailure("This must be overrided in the subclass of HSCenterSlider")
    return 0
  }
  
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
        self.commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
        let selfBundle = Bundle(for: HSCenterSlider.self)
      
        let resourceBundlePath = selfBundle.path(forResource: HSCenterSlider.className, ofType: "bundle")
        
        let nib : UINib = UINib(nibName: self.className, bundle: Bundle(path: resourceBundlePath!) )
        nib.instantiate(withOwner: self, options: nil)
        self.contentView.frame=self.bounds
        self.addSubview(self.contentView)
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        self.thumb.backgroundColor = UIColor.white
        self.thumb.layer.cornerRadius = 30/2
        self.thumb.layer.masksToBounds = true
        self.thumb.elevate(elevation: 2.0)
        
        self.lblProgressValue.alpha = 0.0;
        self.firstHalfProgressView.backgroundColor = tintColor
        self.secondHalfProgressView.backgroundColor = tintColor
        
        self.rangeValue = HSRange(low: -100, high: 100) //default Range for the slider
        self.value = 0; //default progress value
    }
}

//MARK:- Update Progress Value
extension HSCenterSlider{
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
                (self.internalFirstHalfRangeConverter!.range2.high.cgfloat - self.internalFirstHalfRangeConverter!.toRange2(of: progress).cgfloat),
                (self.centerX - self.thumbHalfDementionValue).cgfloat
            )
            self.constrintSecondHalfProgressWidth.constant = 0.0;
            self.constrintFirstHalfProgressWidth.constant = constantValue
            self.constaintThumbCenterValue.constant = -1 * constantValue
            
        case .second(let progress):
            let constantValue = min(
                self.internalSecondHalfRangeConverter!.toRange2(of: progress).cgfloat - self.internalSecondHalfRangeConverter!.range2.low.cgfloat,
                (self.centerX - self.thumbHalfDementionValue).cgfloat
            )
            self.constrintFirstHalfProgressWidth.constant = 0.0;
            self.constrintSecondHalfProgressWidth.constant = constantValue
            self.constaintThumbCenterValue.constant = constantValue
        }
    }
}



//MARK:- Internal Converters
// This is used to devide full range into two ranges [FirstHalf Range and SecondHalf Range]
extension HSCenterSlider: HSCenterSlidableValue {
  
    internal var internalRangeConverter: HSRangeConverter? {
        guard let rangeValue = rangeValue else {
            return nil;
        }
        
        return
            HSRangeConverter(range1: HSRange(low: rangeValue.low, high: rangeValue.high),
                             range2: HSRange(low: 0, high: maxDimentionValue))
    }
    
    internal var internalFirstHalfRangeConverter: HSRangeConverter? {
        guard let internalConverter = self.internalRangeConverter else {
            return nil;
        }
        
        return
            HSRangeConverter(range1: HSRange(low: internalConverter.range1.low, high: internalConverter.range1.mid),
                             range2: HSRange(low: internalConverter.toRange2(of: internalConverter.range1.low), high: internalConverter.toRange2(of: internalConverter.range1.mid))
                            )
    }
    internal var internalSecondHalfRangeConverter: HSRangeConverter? {
        guard let internalConverter = self.internalRangeConverter else {
            return nil;
        }
        
        return
            HSRangeConverter(range1: HSRange(low: internalConverter.range1.mid, high: internalConverter.range1.high),
                             range2: HSRange(low: internalConverter.toRange2(of: internalConverter.range1.mid), high: internalConverter.toRange2(of: internalConverter.range1.high))
                            )
    }
}
