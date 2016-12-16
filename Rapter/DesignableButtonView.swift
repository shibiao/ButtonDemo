//
//  DesignableButtonView.swift
//  Rapter
//
//  Created by sycf_ios on 2016/12/15.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButtonView: UIButton {
    var duration = TimeInterval()
    @IBInspectable var fillColor:UIColor = UIColor.red
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        duration = 2
        fillColor.setFill()
        path.fill()
        drawSign()
        
    }
    func drawSign() {
        drawHorizontalDash()
        drawVerticalDash()
    }
    //画横一字
    func drawHorizontalDash() {
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height)*0.5
        let plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
    
        plusPath.move(to: CGPoint(x: (bounds.width-plusWidth)/2, y: bounds.height/2))
        plusPath.addLine(to: CGPoint(x: bounds.width/2+plusWidth/2, y: bounds.height/2))
        UIColor.white.setStroke()
        plusPath.stroke()
    }
    //画竖一字
    func drawVerticalDash(){
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height)*0.5
        let plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
        
        plusPath.move(to: CGPoint(x: bounds.width/2, y: bounds.height/2+plusWidth/2))
        plusPath.addLine(to: CGPoint(x: bounds.width/2, y: bounds.height/2-plusWidth/2))
        UIColor.white.setStroke()
        plusPath.stroke()
    }
    //点击动画
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: duration/2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseInOut, animations: {() -> Void in self.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)}, completion: nil)
        UIView.animate(withDuration: duration/2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseInOut, animations: {() -> Void in self.transform = CGAffineTransform.init(scaleX: 1, y: 1)}, completion: nil)
    }
    
    
    
}

