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
        
    @ObservedObject var videoManager = VideoManager()
    
    @State var chosenArticle: Article = Article()
    @State var chosenCourse: Course = Course()
    @State var notConnected = false
    
    var resources: [Resource] = [
        Resource(image: "yahoo", name: "Yahoo Finance", url: "https://finance.yahoo.com"),
        Resource(image: "investopedia", name: "Investopedia", url: "https://www.investopedia.com"),
        Resource(image: "morningstar", name: "Morningstar", url: "https://www.morningstar.com"),
        Resource(image: "marketwatch", name: "Market Watch", url: "https://www.marketwatch.com")
    ]
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                    
                VStack {
                    
                    Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.darkGreen, Color.lightGreen]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .frame(height: UIScreen.main.bounds.height / 3)
                        .overlay(
                            
                            VStack{
                                
                                Spacer()
                                
                                Group{
                                    
                                    Text("It's A Great Day To")+Text("\nInvest!").bold()
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 27))
                                .multilineTextAlignment(.center)
                                
                                Spacer()
                            }
                        )
                    
                    Spacer()
                }
                   
                VStack {
                    
                    Rectangle().fill(Color.clear).frame(height: UIScreen.main.bounds.height / 4)
                    
                    ScrollView{
                        
                        VStack {
                            
                            Text("Last Month's News:")
                                .foregroundColor(.white)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            BubbleView{
                                
                                if videoManager.news.count == 0 {
                                    LoadingView()
                                }
                                else{
                                    
                                    LazyVStack{
                                        
                                        ForEach(videoManager.news) { newspaper in
                                            
                                            NavigationLink(
                                                destination: WebView(url: newspaper.url),
                                                label:
                                                {
                                                    HorizontalNewsView      (newspaper:             newspaper)
                                                }
                                            )
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 40)
                            
                            VStack {
                                
                                Text("Resources:")
                                    .foregroundColor(.black)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                
                                BubbleView{
                                    
                                    LazyVStack{
                                        
                                        ForEach(resources) { resource in
                                            
                                            NavigationLink(
                                                destination: WebView(url: resource.url),
                                                label: {
                                                    HorizontalResourceView(resource: resource)
                                                })
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 40)
                            
                            Text("Video of the Month:")
                                .foregroundColor(.black)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            BubbleView{
                                
                                if let video = videoManager.specialVideo.first{
                                    LazyVStack{
                                        
                                        NavigationLink(
                                            destination: SingleSpecialView(video: video),
                                            label: {
                                                
                                                HStack{
                                                    
                                                    VStack {
                                                        
                                                        Text(video.title)
                                                            .font(.system(size: 12, weight: .bold))
                                                        
                                                        Text(video.summary)
                                                            .font(.system(size: 12))
                                                    }
                                                    .frame(width: 180)
                                                    
                                                    WebImage(url: URL(string: video.image))
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                        .cornerRadius(10)
                                                    
                                                    Image(systemName: "chevron.right")
                                                        .foregroundColor(.lightGray2)
                                                        .padding(.leading, 2)
                                                }
                                                .frame(height: UIScreen.main.bounds.height / 6)
                                            })
                                    }
                                }
                                else {
                                    
                                    LoadingView()
                                }
                            }
                            .padding(.bottom, 40)
                            
                            Text("Article of the Month:")
                                .foregroundColor(.black)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            BubbleView{
                                if let article = videoManager.specialArticle.first{
                                    LazyVStack{
                                        
                                        NavigationLink(
                                            destination: DisplayView(chosenArticle: article),
                                            label: {
                                                
                                                HStack{
                                                    
                                                    VStack {
                                                        
                                                        Text(article.title)
                                                            .font(.system(size: 12, weight: .bold))
                                                            .padding(.bottom, 2)
                                                        
                                                        Text("By: \(article.author)")
                                                            .font(.system(size: 12))
                                                            .frame(width: 180, alignment: .leading)
                                                    }
                                                    .frame(width: 180)
                                                    
                                                    WebImage(url: URL(string: article.image))
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                        .cornerRadius(10)
                                                    
                                                    Image(systemName: "chevron.right")
                                                        .foregroundColor(.lightGray2)
                                                        .padding(.leading, 2)
                                                }
                                                .frame(height: UIScreen.main.bounds.height / 6)
                                            })
                                    }
                                }
                                else {
                                    LoadingView()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, UIScreen.main.bounds.height / 8.7)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
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
                
                self.videoManager.fetchSpecial()
                
                self.videoManager.fetchSpecialArticle()

                
                self.videoManager.fetchNews()
                
            }
            .alert(isPresented: $notConnected) { () -> Alert in
                Alert(title: Text("No Internet Connection"),
                message: Text("Check Your Network Connection and Try Again."),
                dismissButton: .cancel())
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
