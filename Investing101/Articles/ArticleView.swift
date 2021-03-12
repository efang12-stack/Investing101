//
//  ArticleView.swift
//  Investing101
//
//  Created by Ethan on 3/11/21.
//

import SwiftUI

struct ArticleView: View {
    
    var chosenCourse: Course
    @ObservedObject var videoManager = VideoManager()
    @State var courseArticles: [Article] = []
    
    var body: some View {
        
        VStack{
            
            HStack {
                    
                Text(chosenCourse.courseTitle)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
                    .padding([.bottom, .leading], 10)
                        
                Spacer()
            }
            .padding(.top, 90)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(LinearGradient(gradient: Gradient(colors: [chosenCourse.colorBackground1, chosenCourse.colorBackground2]), startPoint: .trailing, endPoint: .leading))
            
            if courseArticles.count == 0 {
                
                VStack{
                
                    LoadingView()
                
                    Spacer()
                }
            }
            else{
                
                ScrollView(showsIndicators: false){
                
                    VStack(spacing: 15){
                    
                        ForEach(courseArticles, id: \.id) { article in
                        
                            NavigationLink(destination: DisplayView(chosenArticle: article)) {
                                
                                HorizontalArticleView(article: article)
                            }
                            
                            Divider()
                        }
                    }
                }
                .padding(.top, 10)
            }
        }
        .ignoresSafeArea(edges: .top)
        .onAppear{
            
            self.videoManager.fetchArticles {
                courseArticles = videoManager.articles.filter { article in
                    return article.category == chosenCourse.courseTitle
                }
            }
        }

    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(chosenCourse: Course())
    }
}
