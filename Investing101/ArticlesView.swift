//
//  ArticlesView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArticlesView: View {
    
    @ObservedObject var videoManager = VideoManager()
    
    @State var articleSection: [Sectional] = [
        Sectional(name: "Fin Tech", articles: []),
        Sectional(name: "Cryptocurrency", articles: []),
        Sectional(name: "Investing Tips", articles: []),
        Sectional(name: "Real Estate", articles: []),
        Sectional(name: "Market Opportunities", articles: [])
    ]
    
    @State var chosenArticle : Article = Article(title: "Test", text: "test", image: "test", category: "Fin Tech", author: "Test")
    
    @State var show: Bool = false
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                HStack{
                    
                    Text("Articles")
                        .font(.system(size: 35, weight: .bold))
                        .padding([.leading, .bottom], 15)
                
            
                    Spacer()
                }
                .overlay(Rectangle().stroke(Color.primary.opacity(0.3), lineWidth: 2).shadow(radius: 6).edgesIgnoringSafeArea(.top))
                
                if videoManager.articles.count == 0 {
                    VStack{
                        
                        Text("Loading Articles")
                        
                        Spacer()
                    }
                    
                }
                else{
                    List{
                    
                        ForEach(articleSection, id: \.id) { section in
                            Section(header: Text(section.name).bold()) {
                                ForEach(section.articles) { article in
                                        
                                    ZStack {
                                        
                                        HStack(spacing: 50){
                                                
                                                VStack {
                                                    
                                                    Text(article.title)
                                                        .font(.system(size: 19, weight: .bold))
                                                        .frame(width: 200, height: 130, alignment: .leading)
                                                        
                                                        
                                                    Text("By "+(article.author))
                                                        .foregroundColor(Color.darkGray)
                                                        .font(.custom("Verdana", size: 12))
                                                        .frame(width: 200, alignment: .leading)
                                                }
                                                
                                                WebImage(url: URL(string: article.image))
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)

                                                
                                        }
                                        
                                        NavigationLink(
                                            destination: DisplayView(chosenArticle: article)){
                                            
                                        }.buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0).onTapGesture {
                                            chosenArticle = article
                                        }
                                    }
                        
                                    
                                
                                }
                            }
                        }
                        
                        
                    }
                    .onAppear{
                        
                        for i in 0...4 {
                            for article in videoManager.articles {
                                if articleSection[i].name == article.category {
                                    articleSection[i].articles.append(article)
                                }
                            }
                        }
                    }
                    .onDisappear {
                        for i in 0...4 {
                            articleSection[i].articles = []
                        }
                    }
                    .listStyle(GroupedListStyle())
                
                }
                
            }
            .onAppear {
                videoManager.fetchArticles(collectionName: "articles")
                
                
            }
            .padding(.top, -60)
        
        }
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesView(chosenArticle: Article(title: "", text: "", image: "" , category: "", author: ""))
    }
}
