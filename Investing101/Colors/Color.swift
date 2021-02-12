//
//  Color.swift
//  Investing101
//
//  Created by Ethan on 1/13/21.
//

import Foundation
import SwiftUI

extension Color {
    
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    
    
    static let lightGray = Color.rgb(r: 245, g: 245, b: 245)
    static let lightGray2 = Color.rgb(r: 160, g: 160, b: 160)
    static let darkGray = Color.rgb(r: 96, g: 96, b: 96)
    static let darkerGray = Color.rgb(r: 64, g: 64, b: 64)
    static let litColor1 = Color.rgb(r: 255, g: 194, b: 50)
    static let litColor2 = Color.rgb(r: 83, g: 168, b: 253)
    static let investColor1 = Color.rgb(r: 111, g: 183, b: 255)
    static let investColor2 = Color.rgb(r: 106, g: 212, b: 201)
    static let entreColor1 = Color.rgb(r: 255, g: 144, b: 16)
    static let entreColor2 = Color.rgb(r: 255, g: 216, b: 16)
    static let profesColor1 = Color.rgb(r: 255, g: 204, b: 153)
    static let profesColor2 = Color.rgb(r: 0, g: 76, b: 153)
    static let darkBlue = Color.rgb(r: 14, g: 118, b: 168)
}
