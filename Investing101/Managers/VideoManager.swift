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
    let db = Firestore.firestore()
    
    func fetchData(collectionName: String) {
        db.collection(collectionName).getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
          }

          self.videos = documents.map { queryDocumentSnapshot -> Video in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let summary = data["summary"] as? String ?? ""
            let url = data["url"] as? String ?? ""

            return Video(id: .init(), title: title, summary: summary, url: url)
          }
        }
      }
}
