//
//  Colors.swift
//  CardinalKit
//
//  Created by John Le on 11/19/20.
//

import UIKit

enum Colors {
    
    case red, green, blue, lightBlue, pink, purple, yellow, cardinalRed, stanfordAqua, stanfordGreen, stanfordOrange, stanfordTan,
        stanfordLightTan
    
    var color: UIColor {
        switch self {
            case .red:
                return UIColor(red: 0xEF / 255.0, green: 0x44 / 255.0, blue: 0x5B / 255.0, alpha: 1.0)
                
            case .green:
                return UIColor(red: 0x8D / 255.0, green: 0xC6 / 255.0, blue: 0x3F / 255.0, alpha: 1.0)
                
            case .blue:
                return UIColor(red: 0x3E / 255.0, green: 0xA1 / 255.0, blue: 0xEE / 255.0, alpha: 1.0)
                
            case .lightBlue:
                return UIColor(red: 0x9C / 255.0, green: 0xCF / 255.0, blue: 0xF8 / 255.0, alpha: 1.0)
                
            case .pink:
                return UIColor(red: 0xF2 / 255.0, green: 0x6D / 255.0, blue: 0x7D / 255.0, alpha: 1.0)
                
            case .purple:
                return UIColor(red: 0x9B / 255.0, green: 0x59 / 255.0, blue: 0xB6 / 255.0, alpha: 1.0)
            
            case .yellow:
                return UIColor(red: 0xF1 / 255.0, green: 0xDF / 255.0, blue: 0x15 / 255.0, alpha: 1.0)
            
            case .cardinalRed:
                return UIColor(red: 0x8C / 255.0, green: 0x15 / 255.0, blue: 0x15 / 255.0, alpha: 1.0)
            
            case .stanfordAqua:
                return UIColor(red: 0x00 / 255.0, green: 0x7C / 255.0, blue: 0x92 / 255.0, alpha: 1.0)
            
            case .stanfordGreen:
                return UIColor(red: 0x00 / 255.0, green: 0x9B / 255.0, blue: 0x76 / 255.0, alpha: 1.0)
            
            case .stanfordOrange:
                return UIColor(red: 0xE9 / 255.0, green: 0x83 / 255.0, blue: 0x00 / 255.0, alpha: 1.0)
            
            case .stanfordTan:
                return UIColor(red: 0xB3 / 255.0, green: 0x99 / 255.0, blue: 0x5D / 255.0, alpha: 1.0)
            
            case .stanfordLightTan:
                return UIColor(red: 0xDA / 255.0, green: 0xD7 / 255.0, blue: 0xCB / 255.0, alpha: 1.0)
        }
    }
}
