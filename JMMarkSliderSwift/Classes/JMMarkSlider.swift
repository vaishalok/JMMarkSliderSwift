//
//  JMMarkSlider.swift
//  Pods
//
//  Created by AlokVaish on 09/12/16.
//
//

import UIKit

public class JMMarkSlider: UISlider {
    
    var markWidth           = 1.0
    var markColor           = UIColor(redInt: 106, greenInt: 106, blueInt: 124, alpha: 0.7)
    var selectedBarColor    = UIColor(redInt: 179, greenInt: 179, blueInt: 193, alpha: 0.8)
    var unselectedBarColor  = UIColor(redInt: 55, greenInt: 55, blueInt: 94, alpha: 0.8)
    var markPositions: [Float] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    var handlerImage: UIImage!
    var handlerColor: UIColor!
    //    var cornerRadius:
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // We create an innerRect in which we paint the lines
        var innerRect = rect.insetBy(dx: CGFloat(1.0), dy: CGFloat(10.0))
        UIGraphicsBeginImageContextWithOptions(innerRect.size, false, 0)
        var context = UIGraphicsGetCurrentContext()!
        
        // Selected side
        context.setLineCap(.round)
        context.setLineWidth(CGFloat(12.0))
        context.move(to: CGPoint(x: CGFloat(6), y: CGFloat(innerRect.height / 2)))
        context.addLine(to: CGPoint(x: CGFloat(innerRect.size.width - 10), y: CGFloat(innerRect.height / 2)))
        context.setStrokeColor(self.selectedBarColor.cgColor)
        context.strokePath()
        var selectedSide = UIGraphicsGetImageFromCurrentImageContext()!.resizableImage(withCapInsets: UIEdgeInsets.zero)
        
        // Unselected side
        context.setLineCap(.round)
        context.setLineWidth(CGFloat(12.0))
        context.move(to: CGPoint(x: CGFloat(6), y: CGFloat(innerRect.height / 2)))
        context.addLine(to: CGPoint(x: CGFloat(innerRect.size.width - 10), y: CGFloat(innerRect.height / 2)))
        context.setStrokeColor(self.unselectedBarColor.cgColor)
        context.strokePath()
        var unselectedSide = UIGraphicsGetImageFromCurrentImageContext()!.resizableImage(withCapInsets: UIEdgeInsets.zero)
        
        // Set trips on selected side
        selectedSide.draw(at: CGPoint(x: CGFloat(0), y: CGFloat(0)))
        for i in 0..<self.markPositions.count {
            context.setLineWidth(CGFloat(self.markWidth))
            var position: Float = self.markPositions[i] * Float(innerRect.size.width / 100.0)
            context.move(to: CGPoint(x: CGFloat(position), y: CGFloat(innerRect.height / 2 - 5)))
            context.addLine(to: CGPoint(x: CGFloat(position), y: CGFloat(innerRect.height / 2 + 5)))
            context.setStrokeColor(self.markColor.cgColor)
            context.strokePath()
        }
        var selectedStripSide = UIGraphicsGetImageFromCurrentImageContext()!.resizableImage(withCapInsets: UIEdgeInsets.zero)
        
        // Set trips on unselected side
        unselectedSide.draw(at: CGPoint(x: CGFloat(0), y: CGFloat(0)))
        for i in 0..<self.markPositions.count {
            context.setLineWidth(CGFloat(self.markWidth))
            var position: Float = self.markPositions[i] * Float(innerRect.size.width / 100.0)
            context.move(to: CGPoint(x: CGFloat(position), y: CGFloat(innerRect.height / 2 - 5)))
            context.addLine(to: CGPoint(x: CGFloat(position), y: CGFloat(innerRect.height / 2 + 5)))
            context.setStrokeColor(self.markColor.cgColor)
            context.strokePath()
        }
        
        var unselectedStripSide = UIGraphicsGetImageFromCurrentImageContext()!.resizableImage(withCapInsets: UIEdgeInsets.zero)
        func UIGraphicsEndImageContext() {
            self.setMinimumTrackImage(selectedStripSide, for: .normal)
            self.setMaximumTrackImage(unselectedStripSide, for: .normal)
            if self.handlerImage != nil {
                self.setThumbImage(self.handlerImage, for: .normal)
            }
            else if self.handlerColor != nil {
                self.setThumbImage(UIImage(), for: .normal)
                self.thumbTintColor = self.handlerColor
            }
        }
        
        UIGraphicsEndImageContext()
    }
}

extension UIColor {
    
    convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: CGFloat) {
        let newRed   = CGFloat(Double(redInt) / 255.0)
        let newGreen = CGFloat(Double(greenInt) / 255.0)
        let newBlue  = CGFloat(Double(blueInt) / 255.0)
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(1.0))
    }
    
}
