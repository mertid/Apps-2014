//
//  ratingView.swift
//  LiveIBViews
//
//  Created by Merritt Tidwell on 9/29/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

@IBDesignable
class RatingView: UIView {
    
    var backgroundRingLayer: CAShapeLayer!
    @IBInspectable var myWidth = 20.0 as CGFloat
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if backgroundRingLayer == nil {
            backgroundRingLayer = CAShapeLayer()
            
            let rect = CGRectInset(bounds,myWidth,myWidth)
            let path = UIBezierPath(ovalInRect: rect)
            backgroundRingLayer.path = path.CGPath
            
            backgroundRingLayer.fillColor = nil
            backgroundRingLayer.lineWidth = myWidth
            backgroundRingLayer.borderColor = UIColor.magentaColor().CGColor
            
            layer.addSublayer(backgroundRingLayer)
            
        }
    }
    
    
}
