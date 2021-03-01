//
//  HomeView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Network

struct HomeView: View {
    
    @EnvironmentObject var videoManager : VideoManager
    @EnvironmentObject var savedArticleManager: SavedArticleManager
    @EnvironmentObject var savedVideoManager: SavedVideoManager
    
    @State var chosenArticle: Article = Article()
    @State var chosenCourse: Course = Course()
    @State var notConnected = false
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    var body: some View {
        
        NavigationView{
               
                    VStack{
                        
                        //MARK: - HEADER
                        Header(padding: 20) {
                            
                            Spacer()
                                
                            Image("logo")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding(.bottom, 10)
                            
                            Text("Alpha\nFinance")
                                .font(.custom("Verdana", size: 20))
                                .bold()
                                .padding(.bottom, 10)
                                
                            Spacer()
                        }
                        
                        ScrollView(.vertical, showsIndicators: false, content: {
                                
                                HStack{
                                    
                                    Text("Last Month's News")
                                        .bold()
                                        .foregroundColor(Color.darkGray)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                .padding(.top, 10)
                                
                                if videoManager.news.count == 0 {
                                    LoadingView()
                                }
                                else{
                                    
                                    ScrollView(.horizontal) {
                                        
                                        HStack{
                                            
                                            ForEach(videoManager.news) { newspaper in
                                                
                                                NavigationLink(destination: WebView(url: newspaper.url)) {
                                                    
                                                    HorizontalNewsView(newspaper: newspaper)
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                Divider()
                            
                                HStack{
                                    
                                    Text("Video Of The Week")
                                        .bold()
                                        .foregroundColor(Color.darkGray)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                .padding(.top, 10)
                                
                                if let video = videoManager.specialVideo.first{
                                    
                                    HStack{
                                    
                                        if let url = video.url {
                                        
                                            WebView(url: url)
                                                .frame(width: 150, height: 100)
                                                .cornerRadius(10)
                                        }
                                    
                                        VStack{
                                        
                                            Text(video.title)
                                                .bold()
                                                .frame(width: 200)
                                        
                                            Text(video.summary)
                                                .frame(width: 200)
                                                .multilineTextAlignment(.center)
                                        }
                                        .padding(.leading, 5)
                                    }
                                    
                                }else {
                                    LoadingView()
                                }
                                
                                Divider()
                                
                                HStack{
                                    
                                    Text("Saved Articles")
                                        .bold()
                                        .foregroundColor(Color.darkGray)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                .padding(.top, 10)
                                
                                if savedArticleManager.savedArticles.count == 0 {
                                    
                                    VStack {
                                        
                                        if savedArticleManager.savedArticleIds.count == 0 {
                                            
                                            Text("No Saved Articles")
                                                .foregroundColor(Color.lightGray2)
                                                .font(.custom("Arial", size: 17))
                                                .padding(.vertical, 10)
                                        }
                                        else {
                                            LoadingView()
                                        }
                                    }
                                }
                                else {
                                        
                                    VStack{
                                        
                                        ForEach(savedArticleManager.savedArticles) { article in
                                            
                                            NavigationLink(destination: DisplayView(chosenArticle: article)) {
                                                
                                                VStack {
                                                    
                                                    HorizontalArticleView(article: article)
                                                    
                                                    Divider()
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
                                .padding(.top, 10)
                                
                                if savedVideoManager.savedCourses.count == 0 {
                                    
                                    VStack {
                                        
                                        if savedVideoManager.savedCourseNames.count == 0 {
                                            
                                            Text("No Saved Courses")
                                                .foregroundColor(Color.lightGray2)
                                                .font(.custom("Arial", size: 17))
                                                .padding([.top,.bottom], 10)
                                        }
                                        else {
                                            LoadingView()
                                        }
                                    }
                                }
                                else {
                                        
                                    VStack{
                                        
                                        ForEach(savedVideoManager.savedCourses) { course in
                                            
                                            NavigationLink(destination: VideosView(chosenCourse: course)) {
                                                
                                                VStack{
                                                    
                                                    HorizontalCourseView(course: course)
                                                    
                                                    Divider()
                                                }
                                            }
                                        }
                                    }
                                }
                        })
                        .onAppear{
                            
                            monitor.start(queue: queue)
                            
                            monitor.pathUpdateHandler = { path in
                                
                                if path.status == .satisfied {
                                    print("We're connected!")
                                }
                                else {
                                    notConnected = true
                                }
                            }
                            
                            savedArticleManager.setArticleIDs()

                            savedVideoManager.setCourseNames()
                            
                            self.videoManager.fetchSpecial()
                            
                            self.videoManager.fetchNews()
                            
                            self.videoManager.fetchArticles(
                            {
                                savedArticleManager.getSavedArticles(articles: videoManager.articles)
                            })
                            
                            self.savedVideoManager.getSavedCourses()
                        }
                        .alert(isPresented: $notConnected) { () -> Alert in
                            Alert(title: Text("No Internet Connection"),
                            message: Text("Check Your Network Connection and Try Again."),
                            dismissButton: .cancel())
                        }
                    }
                    .navigationTitle("")
                    .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
