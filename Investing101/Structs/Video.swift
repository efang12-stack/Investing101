//
//  Video.swift
//  Investing101
//
//  Created by Ethan on 1/15/21.
//

import Foundation

struct Video: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String
    var summary: String
    var url: String
    
    
}
