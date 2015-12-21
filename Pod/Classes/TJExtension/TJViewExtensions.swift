//
//  TJViewExtensions.swift
//  TJExtension
//
//  Created by tajika on 2015/12/08.
//  Copyright © 2015年 Tajika. All rights reserved.
//

import UIKit

public enum TJViewBorderPosition {
    case Top
    case Right
    case Bottom
    case Left
}

public extension UIView {
    
    func border(borderWidth borderWidth: CGFloat, borderColor: UIColor?, borderRadius: CGFloat?) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.CGColor
        if let _ = borderRadius {
            self.layer.cornerRadius = borderRadius!
        }
        self.layer.masksToBounds = true
    }

    func border(positions: [TJViewBorderPosition], borderWidth: CGFloat, borderColor: UIColor?) {

        let topLine = CALayer()
        let leftLine = CALayer()
        let bottomLine = CALayer()
        let rightLine = CALayer()
        let defaultBorderColor = UIColor.whiteColor()
        var CGBorderColor: CGColor
        
        self.layer.sublayers = nil
        self.layer.masksToBounds = true

        if let _ = borderColor {
            CGBorderColor = borderColor!.CGColor
        } else {
            CGBorderColor = defaultBorderColor.CGColor
        }
        
        if positions.contains(.Top) {
            topLine.frame = CGRectMake(0.0, 0.0, self.frame.width, borderWidth)
            topLine.backgroundColor = CGBorderColor
            self.layer.addSublayer(topLine)
        }
        if positions.contains(.Left) {
            leftLine.frame = CGRectMake(0.0, 0.0, borderWidth, self.frame.height)
            leftLine.backgroundColor = CGBorderColor
            self.layer.addSublayer(leftLine)
        }
        if positions.contains(.Bottom) {
            bottomLine.frame = CGRectMake(0.0, self.frame.height - borderWidth, self.frame.width, borderWidth)
            bottomLine.backgroundColor = CGBorderColor
            self.layer.addSublayer(bottomLine)
        }
        if positions.contains(.Right) {
            rightLine.frame = CGRectMake(self.frame.width - borderWidth, 0.0, borderWidth, self.frame.height)
            rightLine.backgroundColor = CGBorderColor
            self.layer.addSublayer(rightLine)
        }

    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let _ = self.layer.borderColor {
                return UIColor(CGColor: self.layer.borderColor!)
            }
            return nil
        }
        set {
            self.layer.borderColor = newValue?.CGColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
