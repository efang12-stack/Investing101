//
//  HorizontalArticleSavedView.swift
//  Investing101
//
//  Created by Ethan on 3/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HorizontalArticleView: View {
    
    var article: Article
    var body: some View {
        
        HStack {
            
            HStack(spacing: 40){
                
                VStack {
                    
                    Text(article.title)
                        .font(.custom("Verdana", size: 15))
                        .bold()
                        .frame(width: 200, height: 90, alignment: .leading)
                    
                    Text("By "+(article.author))
                        .foregroundColor(Color.darkGray)
                        .font(.custom("Verdana", size: 12))
                        .frame(width: 200, alignment: .leading)
                        .padding(.top, -5)
                }
                
                WebImage(url: URL(string: article.image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)

            }
            .frame(height: 115)
            
            Image(systemName: "chevron.right")
                .foregroundColor(.lightGray2)
                .font(.headline)
        }
    }
}

struct HorizontalArticleSavedView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalArticleView(article: Article())
    }
}
