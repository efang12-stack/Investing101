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
    
    
    static let lightBlue = Color.rgb(r: 0, g: 191, b: 255)
    
    
}