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
        Sectional(name: "Market Opportunities", articles: []),
        Sectional(name: "Quantitative Finance", articles: []),
        Sectional(name: "Personal Financial Literacy", articles: [])
    ]
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                Header{
                    
                    Text("Articles")
                        .font(.system(size: 35, weight: .bold))
                        .padding([.leading, .bottom], 15)
                    
                    Spacer()
                }
                
                if videoManager.articles.count == 0 {
                    VStack{
                        
                        Spacer()
                        
                        LoadingView()
                        
                        Spacer()
                    }
                }
                else{
                    
                    List{
                    
                        ForEach(articleSection, id: \.id) { section in
                            Section(header: Text(section.name).bold()) {
                                ForEach(section.articles) { article in
                                        
                                    NavigationLink(destination: DisplayView(chosenArticle: article)) {
                                        HorizontalArticleView(article: article)
                                    }
                                }
                            }
                        }
                    }
                    .onAppear{
                        
                        for i in 0...(articleSection.count-1) {
                            for article in videoManager.articles {
                                
                                if articleSection[i].name == article.category {
                                    articleSection[i].articles.append(article)
                                }
                            }
                        }
                    }
                    .onDisappear {
                        for i in 0...(articleSection.count-1) {
                            articleSection[i].articles = []
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .onAppear {
                videoManager.fetchArticles({})
            }
        }
    }
}


struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesView()
    }
}
