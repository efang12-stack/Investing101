//
//  Article.swift
//  Investing101
//
//  Created by Ethan on 1/20/21.
//

import Foundation


struct Article: Identifiable {
    
    var id = UUID()
    var title: String
    var text: String
    var image: String
    var category: String
    var author: String
    
}

struct Sectional: Identifiable {
    
    var id = UUID()
    var name: String 
    var articles: [Article]
}
