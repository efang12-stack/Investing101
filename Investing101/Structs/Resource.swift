//
//  Resource.swift
//  Investing101
//
//  Created by Ethan on 3/10/21.
//

import Foundation

struct Resource: Identifiable {
    
    var id: String = UUID().uuidString
    var image: String = ""
    var name: String = ""
    var url: String = ""
    
}
