//
//  Video.swift
//  Investing101
//
//  Created by Ethan on 1/15/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Video: Identifiable, Codable {
    
    @DocumentID var id: String?
    var title: String = ""
    var summary: String = ""
    var url: String = ""
    var image: String = ""
    var objectives: String = ""
}
