//
//  SavedArticleID.swift
//  Investing101
//
//  Created by Ethan on 1/30/21.
//

import Foundation


class SavedArticleManager: ObservableObject {
    
    @Published var savedArticleIds = [String]()
    @Published var savedArticles = [Article]()
    let defaults = UserDefaults.standard
    
    init() {
        setArticleIDs()
    }
    
    func setArticleIDs() {
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
    
    func getSavedArticles(articles: [Article]) {
        
        savedArticles = []
        
        for article in articles {
            let id = article.id ?? ""
            if savedArticleIds.contains(id) {
                savedArticles.append(article)
            }
        }
    }
}
