//
//  UIColor.swift
//  CustomColor
//
//  Created by Евгений Волошенко on 28.03.2022.
//

import UIKit

extension UIColor {
    
    var redValue: CGFloat { return CIColor(color: self).red }
    var greenValue: CGFloat { return CIColor(color: self).green }
    var blueValue: CGFloat { return CIColor(color: self).blue }
    
}
