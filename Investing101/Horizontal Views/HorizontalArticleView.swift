//
//  HorizontalArticleView.swift
//  Investing101
//
//  Created by Ethan on 2/24/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HorizontalArticleView: View {
    
    var article: Article
    var body: some View {
        
            HStack(spacing: 50){
                
                VStack {
                    
                    Text(article.title)
                        .font(.system(size: 19, weight: .bold))
                        .frame(width: 200, height: 90, alignment: .leading)
                    
                    Text("By "+(article.author))
                        .foregroundColor(Color.darkGray)
                        .font(.custom("Verdana", size: 12))
                        .frame(width: 200, alignment: .leading)
                        .padding(.top, -5)
                }
                
                WebImage(url: URL(string: article.image))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            .frame(height: 135)   
    }
}

struct HorizontalArticleView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalArticleView(article: Article())
    }
}
