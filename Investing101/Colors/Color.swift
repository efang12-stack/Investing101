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
    static let litColor1 = Color.rgb(r: 204, g: 0, b: 0)
    static let litColor2 = Color.rgb(r: 0, g: 255, b: 255)
    static let investColor1 = Color.rgb(r: 111, g: 183, b: 255)
    static let investColor2 = Color.rgb(r: 106, g: 212, b: 201)
    static let entreColor1 = Color.rgb(r: 255, g: 144, b: 16)
    static let entreColor2 = Color.rgb(r: 255, g: 216, b: 16)
    static let profesColor1 = Color.rgb(r: 255, g: 204, b: 153)
    static let profesColor2 = Color.rgb(r: 0, g: 76, b: 153)
    static let darkBlue = Color.rgb(r: 14, g: 118, b: 168)
    static let darkGreen = Color.rgb(r: 0, g: 153, b: 76)
    static let lightGreen = Color.rgb(r: 102, g: 204, b: 0)
    static let marketColor1 = Color.rgb(r: 76, g: 0, b: 153)
    static let marketColor2 = Color.rgb(r: 255, g: 255, b: 0)
    static let quantColor1 = Color.rgb(r: 0, g: 0, b: 204)
    static let quantColor2 = Color.rgb(r: 102, g: 0, b: 204)
    static let personalfinColor1 = Color.rgb(r: 204, g: 102, b: 0)
    static let personalfinColor2 = Color.rgb(r: 255, g: 255, b: 51)
    static let investtechColor1 = Color.rgb(r: 255, g: 128, b: 0)
    static let investtechColor2 = Color.rgb(r: 96, g: 96, b: 96)
}
