//
//  News.swift
//  Investing101
//
//  Created by Ethan on 2/8/21.
//

import Foundation
import FirebaseFirestoreSwift


struct News: Identifiable, Codable {
    
    @DocumentID var id: String?
    var title: String
    var url: String
    var image: String
    
}
