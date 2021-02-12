//
//  VideoManager.swift
//  Investing101
//
//  Created by Ethan on 1/15/21.
//

import Foundation
import SwiftUI
import Firebase

class VideoManager: ObservableObject {
    
    @Published var videos = [Video]()
    @Published var articles = [Article]()
    @Published var news = [News]()
    let db = Firestore.firestore()
    
    func fetchData(collectionName: String) {
        db.collection(collectionName).getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No videos")
            return
          }

          self.videos = documents.map { queryDocumentSnapshot -> Video in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let summary = data["summary"] as? String ?? ""
            let url = data["url"] as? String ?? ""
            
            
            return Video(id: queryDocumentSnapshot .documentID, title: title, summary: summary, url: url)
          }
            
            
        }
       
      }
    
    
    func fetchArticles(collectionName: String,  completion: @escaping () -> ()) {

        db.collection(collectionName).getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No articles")
            return
          }

          self.articles = documents.map { queryDocumentSnapshot -> Article in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let text = data["text"] as? String ?? ""
            let newText = text.replacingOccurrences(of: "\\n", with: "\n")
            let image = data["image"] as? String ?? ""
            let category = data["category"] as? String ?? ""
            let author = data["author"] as? String ?? ""
            
            
            return Article(id: queryDocumentSnapshot .documentID, title: title, text: newText, image: image, category: category, author: author)
          }
                
            
            completion()
        }
            
    
    }
    
    func fetchNews(collectionName: String) {
        db.collection(collectionName).getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No articles")
            return
          }

          self.news = documents.map { queryDocumentSnapshot -> News in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let url = data["url"] as? String ?? ""
            let image = data["image"] as? String ?? ""
            
            return News(id: queryDocumentSnapshot .documentID, title: title, url: url, image: image)
          }
                
            
            
        }
        
    }
    
    
}
