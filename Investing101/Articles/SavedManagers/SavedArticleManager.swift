//
//  SavedArticleID.swift
//  Investing101
//
//  Created by Ethan on 1/30/21.
//

import Foundation


class SavedArticleManager: ObservableObject {
    
    @Published var savedArticleIds = [String]()
    let defaults = UserDefaults.standard
    
    init() {
        
        retrieveArticleIDs()
        
    }
    
    func retrieveArticleIDs() {
        if let defaultsIDs = defaults.stringArray(forKey: "savedArticleIDs"){
            savedArticleIds = defaultsIDs
        } else {
            savedArticleIds = []
        }
    }
    
    func saveArticle(withID ID: String) {
        
        savedArticleIds.append(ID)
        defaults.setValue(savedArticleIds, forKey: "savedArticleIDs")
    }
    
    
    
    func deleteArticle(withID ID: String) {
        
        guard let index = savedArticleIds.firstIndex(of: ID) else { fatalError("No index found") }
        savedArticleIds.remove(at: index)
        defaults.setValue(savedArticleIds, forKey: "savedArticleIDs")
    }
}
