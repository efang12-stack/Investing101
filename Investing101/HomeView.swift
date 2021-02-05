//
//  HomeView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @ObservedObject var videoManager = VideoManager()
    @ObservedObject var savedArticleManager = SavedArticleManager()
    @ObservedObject var savedVideoManager = SavedVideoManager()
    @State var chosenArticle: Article = Article(id: "", title: "", text: "", image: "", category: "", author: "")
    @State var chosenCourse: Course = Course(courseTitle: "", image: "", description: "", dataKey: "", colorBackground1: Color.blue, colorBackground2: Color.blue)
    @State var show = false
    @State var show1 = false
    
    var body: some View {
        

        
        NavigationView{
        ZStack(alignment: .leading) {
            GeometryReader{_ in
                VStack{
                    
                    ZStack{
                        
                        HStack{
                            
                            VStack {
                                Text("It's A Great Day To Invest")
                                    .font(.custom("Verdana", size: 25))
                                    .bold()
                                    .frame(width: 250)
                                    .padding(.bottom, 10)
                                
                                    
                                    
                                
                                
                            }
                            
                            Spacer()
                        }
                            
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                    .padding(.top, -75)
                    
                    
                    ScrollView{
                        
                        VStack {
                        
                            HStack{
                                
                                Text("Video Of The Week")
                                    .bold()
                                    .foregroundColor(Color.darkGray)
                                    .padding(.leading)
                            
                                Spacer()
                            }
                            .padding(.top, 10)
                            
                            
                                if videoManager.videos.count == 0 {
                                    
                                    HStack {
                                        
                                            Spacer()
                                        
                                            LoadingView()
                                        
                                            Spacer()
                                    }
                                }
                                else {
                                    
                                    HStack{
                                        if let url = videoManager.videos[0].url {
                                            
                                            
                                            Webview(url: url)
                                                .frame(width: 150, height: 100)
                                                .cornerRadius(10)
                                            
                                                
                                        }
                                        
                                        VStack{
                                            Text(videoManager.videos[0].title)
                                                .bold()
                                                .frame(width: 200)
                                            
                                            Text(videoManager.videos[0].summary)
                                                .frame(width: 200)
                                                .multilineTextAlignment(.center)
                                        }
                                        .padding(.leading, 5)
                                        
                                        
                                    }
                                }
                            
                            Divider()
                            
                            HStack{
                                
                                Text("Saved Articles")
                                    .bold()
                                    .foregroundColor(Color.darkGray)
                                    .padding(.leading)
                            
                                Spacer()
                            }
                            .padding([.top, .bottom], 10)
                            
                        
                            
                            if savedArticleManager.savedArticles.count == 0 {
                                
                                LoadingView()
                            }
                            else {
                                
                                ZStack {
                                
                                    NavigationLink(
                                        destination: DisplayView(chosenArticle: chosenArticle),
                                        isActive: self.$show,
                                        label: {
                                            Text("")
                                        })
                                
                                    VStack{
                                    
                                    ForEach(savedArticleManager.savedArticles) { article in
                                        
                                            VStack {

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


                                                Divider()
                                                
                                            }.onTapGesture {
                                                chosenArticle = article
                                                self.show.toggle()
                                            }
       
                                        
                                    }
                                    
                                }
                                }
                                
                            }
                            
                            
                            HStack{
                                
                                Text("Saved Courses")
                                    .bold()
                                    .foregroundColor(Color.darkGray)
                                    .padding(.leading)
                            
                                Spacer()
                            }
                            .padding([.top, .bottom], 10)
                            
                            if savedVideoManager.savedCourses.count == 0 {
                                
                                LoadingView()
                            }
                            else {
                                
                                ZStack{
                                    
                                    NavigationLink(
                                        destination: VideosView(chosenCourse: chosenCourse),
                                        isActive: self.$show1,
                                        label: {
                                            Text("")
                                        })
                                    
                                    VStack{
                                        
                                        ForEach(savedVideoManager.savedCourses) {
                                            course in
                                            
                                            VStack{
                                                
                                                HStack{
                                                    
                                                    Image(course.image)
                                                        .resizable()
                                                        .clipShape(Circle())
                                                        .frame(width: 90, height: 110)
                                                        .padding(.trailing, 20)
                                                    
                                                    VStack{
                                                        Text(course.courseTitle)
                                                            .font(.custom("Verdana", size: 15))
                                                            .bold()
                                                            .frame(maxWidth: 180, alignment: .leading)
                                                            .padding(.bottom, 1)
                                                        
                                                        Text(course.description)
                                                            .font(.custom("Verdana", size: 14))
                                                            .foregroundColor(Color.darkGray)
                                                            .frame(maxWidth: 180, alignment: .leading)
                                                    }
                                                    
                                                    Image(systemName: "chevron.right")
                                                        .padding(.leading, 15)
                                                        .font(.headline)
                                                
                                                }
                                                
                                                Divider()
                                                
                                            }
                                            .onTapGesture {
                                                chosenCourse = course
                                                self.show1.toggle()
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
    
                            
                            
                        }
                    }
                    .onAppear() {
                        
                        savedArticleManager.setArticleIDs()
                        
                        savedVideoManager.setCourseNames()
                        
                        self.videoManager.fetchData(collectionName: "special")
                        
                        self.videoManager.fetchArticles(collectionName: "articles", 
                                completion:
                                    {
                
                                        savedArticleManager.getSavedArticles(articles: videoManager.articles)
                                    
                                    
                                })
                        
                        self.savedVideoManager.getSavedCourses()
                        
                        
                        
                    }
                    
                    
                }
            }
            
            
            
                    
                
            
            
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
