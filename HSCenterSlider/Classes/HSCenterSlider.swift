//
//  HSCenterSlider.swift
//  HSCenterSlider
//
//  Created by Hitendra Solanki on 04/17/2018.
//  Copyright (c) 2018 Hitendra Solanki. All rights reserved.
//

import UIKit
import HSRange

public class HSCenterSlider: UIControl {
    
    enum HSProgressType {
        case left(progress: Double)
        case right(progress: Double)
    }
    
    //MARK:- Delegate
    public weak var delegate: HSCenterSliderDelegate?
    
    //MARK:- IBOutlets
    @IBOutlet private var contentView: UIView!

    @IBOutlet internal weak var thumb: UIView!
    @IBOutlet private weak var leftProgressView: UIView!
    @IBOutlet private weak var rightProgressView: UIView!
    @IBOutlet internal weak var lblProgressValue: UILabel!
    
    @IBOutlet private weak var constaintThumbCenterX: NSLayoutConstraint!
    @IBOutlet internal weak var constrintLeftProgressWidth: NSLayoutConstraint!
    @IBOutlet internal weak var constrintRightProgressWidth: NSLayoutConstraint!
    
    //MARK:- iVars
    internal var isMovingThumb = false;
    internal let thumbHalfWidth: Double = 15
    
    override public var tintColor: UIColor! {
        didSet{
            super.tintColor = tintColor;
            self.leftProgressView.backgroundColor = tintColor
            self.rightProgressView.backgroundColor = tintColor
        }
    }
    
    public var rangeValue: HSRange?
    public var value: Double = 0.0 {
        didSet{
            
            self.lblProgressValue.text = String.init(format: "%.0f", arguments: [self.value])
            if self.value < self.internalRightHalfRangeConverter!.range1.low {
                self.setProgressOnUI(progressType: HSProgressType.left(progress: (value)))
            }else{
                self.setProgressOnUI(progressType: HSProgressType.right(progress: (value)))
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
        
        let nib : UINib = UINib(nibName: HSCenterSlider.className, bundle: Bundle(path: resourceBundlePath!) )
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
        self.leftProgressView.backgroundColor = tintColor
        self.rightProgressView.backgroundColor = tintColor
        
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
    
    private func setProgressOnUI(progressType: HSProgressType){
        switch progressType {
        case .left(let progress):
            let constantValue = min(
                (self.internalLeftHalfRangeConverter!.range2.high.cgfloat - self.internalLeftHalfRangeConverter!.toRange2(of: progress).cgfloat),
                (self.centerX - self.thumbHalfWidth).cgfloat
            )
            self.constrintRightProgressWidth.constant = 0.0;
            self.constrintLeftProgressWidth.constant = constantValue
            self.constaintThumbCenterX.constant = -1 * constantValue
            
        case .right(let progress):
            let constantValue = min(
                self.internalRightHalfRangeConverter!.toRange2(of: progress).cgfloat - self.internalRightHalfRangeConverter!.range2.low.cgfloat,
                (self.centerX - self.thumbHalfWidth).cgfloat
            )
            self.constrintLeftProgressWidth.constant = 0.0;
            self.constrintRightProgressWidth.constant = constantValue
            self.constaintThumbCenterX.constant = constantValue
        }
    }
}



//MARK:- Internal Converters
extension HSCenterSlider {
    internal var internalRangeConverter: HSRangeConverter? {
        guard let rangeValue = rangeValue else {
            return nil;
        }
        
        return
            HSRangeConverter(range1: HSRange(low: rangeValue.low, high: rangeValue.high),
                             range2: HSRange(low: 0, high: self.bounds.size.width.double))
    }
    
    internal var internalLeftHalfRangeConverter: HSRangeConverter? {
        guard let internalConverter = self.internalRangeConverter else {
            return nil;
        }
        
        return
            HSRangeConverter(range1: HSRange(low: internalConverter.range1.low, high: internalConverter.range1.mid),
                             range2: HSRange(low: internalConverter.toRange2(of: internalConverter.range1.low), high: internalConverter.toRange2(of: internalConverter.range1.mid))
                            )
    }
    internal var internalRightHalfRangeConverter: HSRangeConverter? {
        guard let internalConverter = self.internalRangeConverter else {
            return nil;
        }
        
        return
            HSRangeConverter(range1: HSRange(low: internalConverter.range1.mid, high: internalConverter.range1.high),
                             range2: HSRange(low: internalConverter.toRange2(of: internalConverter.range1.mid), high: internalConverter.toRange2(of: internalConverter.range1.high))
                            )
    }
}
