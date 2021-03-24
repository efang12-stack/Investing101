//
//  Course.swift
//  Investing101
//
//  Created by Ethan on 2/24/21.
//

import Foundation
import UIKit
import SwiftUI

struct Course: Identifiable {
    
    var id: String = UUID().uuidString
    
    var courseTitle: String = ""
    var image: String = ""
    var description: String = ""
    var dataKey: String = ""
    
    var colorBackground1: Color = Color.white
    var colorBackground2: Color = Color.white
}
