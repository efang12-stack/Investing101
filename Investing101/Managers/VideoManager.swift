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
    @Published var specialVideo = [Video]()
    @Published var specialArticle = [Article]()
    @Published var articles = [Article]()
    @Published var news = [News]()
    let db = Firestore.firestore()
        
    func fetchVideos(collectionName: String) {
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
            let image = data["image"] as? String ?? ""
            let objectives = data["objectives"] as? String ?? ""
            let newObjectives = objectives.replacingOccurrences(of: "\\n", with: "\n")
            
            return Video(id: queryDocumentSnapshot .documentID, title: title, summary: summary, url: url, image: image, objectives: newObjectives)
          }
        }
    }
    
    func fetchSpecialVideo() {
        db.collection("special").getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No videos")
            return
          }

          self.specialVideo = documents.map { queryDocumentSnapshot -> Video in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let summary = data["summary"] as? String ?? ""
            let url = data["url"] as? String ?? ""
            let image = data["image"] as? String ?? ""
            
            return Video(id: queryDocumentSnapshot .documentID, title: title, summary: summary, url: url, image: image)
          }
        }
    }
    
    func fetchSpecialArticle() {
        db.collection("specialarticle").getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No articles")
            return
          }

          self.specialArticle = documents.map { queryDocumentSnapshot -> Article in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let text = data["text"] as? String ?? ""
            let newText = text.replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\t", with: "\t")
            let image = data["image"] as? String ?? ""
            let author = data["author"] as? String ?? ""
            
            return Article(id: queryDocumentSnapshot .documentID, title: title, text: newText, image: image, author: author)
          }
        }
    }
    
    func fetchArticles(_ completion: @escaping () -> ()) {
        db.collection("articles").getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No articles")
            return
          }

          self.articles = documents.map { queryDocumentSnapshot -> Article in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let text = data["text"] as? String ?? ""
            let newText = text.replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\t", with: "\t")
            let image = data["image"] as? String ?? ""
            let author = data["author"] as? String ?? ""
            let category = data["category"] as? String ?? ""
            
            return Article(id: queryDocumentSnapshot .documentID, title: title, text: newText, image: image, author: author, category: category)
          }
            completion()
        }
    }
    
    func fetchNews() {
        db.collection("news").getDocuments { (querySnapshot, error) in
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
    
//    func fetchWriters() {
//        db.collection("writers").getDocuments { (querySnapshot, error) in
//          guard let documents = querySnapshot?.documents else {
//            print("No articles")
//            return
//          }
//
//          self.writers = documents.map { queryDocumentSnapshot -> Writer in
//            let data = queryDocumentSnapshot.data()
//            let name = data["name"] as? String ?? ""
//            let image = data["image"] as? String ?? ""
//            
//            return Writer(id: queryDocumentSnapshot .documentID, name: name, image: image)
//          }
//        }
//        
//    }
    
    
}
