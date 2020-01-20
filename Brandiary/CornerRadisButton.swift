//
//  CornerRadisButton.swift
//  Brandiary
//
//  Created by young on 24/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

@IBDesignable
class CornerRadisButton: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor(red:0.020,  green:0.522,  blue:1, alpha:1)
    @IBInspectable var borderWidth: CGFloat = 1
    @IBInspectable var cornerRadius: CGFloat = 4
    
    @IBInspectable var roundCornerTopLeft: Bool = true
    @IBInspectable var roundCornerTopRight: Bool = true
    @IBInspectable var roundCornerBottomLeft: Bool = true
    @IBInspectable var roundCornerBottomRight: Bool = true
    
    private var borderLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.borderWidth = borderWidth
        borderLayer.fillColor = UIColor.white.withAlphaComponent(0).cgColor
        
        layer.insertSublayer(borderLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var rectCorners: UIRectCorner = []
        
        if roundCornerTopLeft { rectCorners.insert(.topLeft) }
        if roundCornerTopRight { rectCorners.insert(.topRight) }
        if roundCornerBottomLeft { rectCorners.insert(.bottomLeft) }
        if roundCornerBottomRight { rectCorners.insert(.bottomRight) }
        
        let borderPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: rectCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        borderLayer.path = borderPath.cgPath
    }

}
