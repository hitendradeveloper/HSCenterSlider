//
//  HSCenterSlider+UIKit.swift
//  HSCenterSlider
//
//  Created by Hitendra Solanki on 04/17/2018.
//  Copyright (c) 2018 Hitendra Solanki. All rights reserved.
//
//  UIKit Helpers for HSCenterSlider

import Foundation

//MARK:- Elevate view -> i.e. Shadow
internal protocol MaterialView {
    func elevate(elevation: Double)
}
extension UIView: MaterialView {
    internal func elevate(elevation: Double){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = abs(CGFloat(elevation))
        self.layer.shadowOpacity = 0.24
    }
}

//MARK:- Touches Event + Geometry
extension HSCenterSlider {
    internal var centerX: Double {
        return Double(self.bounds.size.width) / 2.0
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let movingPoint = touches.first?.location(in: self) else{
            return
        }
        self.isMovingThumb = self.hitTest(movingPoint, with: event) == self.thumb
        UIView.animate(withDuration: 1.0) {
            self.lblProgressValue.alpha = 1.0
        }
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let movingPoint = touches.first?.location(in: self) else{
            return
        }
        if isMovingThumb {
            let value = self.internalRangeConverter!.toRange1(of: Double(movingPoint.x))
            self.value = self.rangeValue!.innerValue(value: value)
            self.delegate?.centerSlider(slider: self, didChange: self.value)
        }
    }
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isMovingThumb = false
        UIView.animate(withDuration: 1.0) {
            self.lblProgressValue.alpha = 0.0
        }
    }
}
