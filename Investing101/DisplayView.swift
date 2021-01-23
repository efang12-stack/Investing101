//
//  DisplayView.swift
//  Investing101
//
//  Created by Ethan on 1/22/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DisplayView: View {
    
    @State var chosenArticle: Article
    @Binding var show: Bool
    
    var body: some View {
            
            ZStack {
            
            
            
            ScrollView{
                
                VStack {
                
                    Text(chosenArticle.category)
                        .foregroundColor(Color.darkGray)
                        .padding(.bottom, 15)
                
                    Text(chosenArticle.title)
                        .font(.title)
                
                    WebImage(url: URL(string: chosenArticle.image))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                
                    Text("By: "+(chosenArticle.author))
                        .padding(.bottom, 20)
                
                    Text(chosenArticle.text)
                
                    Spacer()
                }
            }
        }
            
       
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(chosenArticle: Article(title: "How to Build A Company", text: "This is the first part to building a company", image: "", category: "Fin Tech", author: "Ethan Fang"), show: .constant(true))
    }
}
