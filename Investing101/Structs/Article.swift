//
//  Article.swift
//  Investing101
//
//  Created by Ethan on 1/20/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Article: Identifiable, Codable {
    
    @DocumentID var id: String?
    var title: String = ""
    var text: String = ""
    var image: String = ""
    var author: String = ""
    var category: String = ""
}

struct Sectional: Identifiable {
    
    var id = UUID()
    var name: String 
    var articles: [Article]
}
