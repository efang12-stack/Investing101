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

    @State var notConnected = false
    
    var resources: [Resource] = [
        .init(image: "yahoo", name: "Yahoo Finance", url: "https://finance.yahoo.com"),
        .init(image: "investopedia", name: "Investopedia", url: "https://www.investopedia.com"),
        .init(image: "morningstar", name: "Morningstar", url: "https://www.morningstar.com"),
        .init(image: "marketwatch", name: "Market Watch", url: "https://www.marketwatch.com")
    ]
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 4)
                
                ScrollView{
                    
                    VStack {
                        
                        Text("Where To Start:")
                            .font(.custom("Verdana", size: 18))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        BubbleView{
                            
                            if let video = videoManager.specialVideo.first{
                                LazyVStack{
                                    
                                    NavigationLink(
                                        destination: SingleSpecialView(video: video)){
                                            
                                            HStack{
                                                
                                                VStack {
                                                    
                                                    Text(video.title)
                                                        .font(.custom("Verdana", size: 15))
                                                        .bold()
                                                        .frame(width: 170, alignment: .leading)
                                                    
                                                    Text(video.summary)
                                                        .font(.custom("Verdana", size: 13))
                                                        .frame(width: 170)
                                                }
                                                .frame(width: 180)
                                                
                                                WebImage(url: URL(string: video.image))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 65, height: 65)
                                                    .cornerRadius(10)
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.lightGray2)
                                                    .padding(.leading, 5)
                                            }
                                            .frame(height: UIScreen.main.bounds.height / 6)
                                        }
                                }
                            }
                            else {
                                
                                ProgressView()
                            }
                        }
                        .padding(.bottom, 40)
                        
                        Text("Article of the Month:")
                            .font(.custom("Verdana", size: 18))
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        BubbleView{
                            if let article = videoManager.specialArticle.first{
                                LazyVStack{
                                    
                                    NavigationLink(
                                        destination: DisplayView(chosenArticle: article)){
                                                
                                            VStack{
                                                
                                                    WebImage(url: URL(string: article.image))
                                                        .resizable()
                                                        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 5)
                                                        .cornerRadius(10)
                                                
                                                    Text(article.title)
                                                        .font(.custom("Verdana", size: 18))
                                                        .bold()
                                                        .frame(width: UIScreen.main.bounds.width / 1.3, alignment: .leading)
                                                        .padding(.bottom, 2)
                                                    
                                                    Text("By: \(article.author)")
                                                        .font(.custom("Verdana", size: 15))
                                                        .frame(width: UIScreen.main.bounds.width / 1.3, alignment: .leading)
                                            }
                                            .frame(height: UIScreen.main.bounds.height / 2.6)
                                        }
                                }
                            }
                            else {
                                ProgressView()
                            }
                        }
                        .padding(.bottom, 40)
                        
                        VStack {
                            
                            Text("Resources:")
                                .font(.custom("Verdana", size: 18))
                                .foregroundColor(.black)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            BubbleView{
                                
                                LazyVStack{
                                    
                                    ForEach(resources) { resource in
                                        
                                        NavigationLink(
                                            destination: WebView(url: resource.url)){
                                                HorizontalResourceView(resource: resource)
                                            }
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 40)
                        
                        Text("Last Month's News:")
                            .font(.custom("Verdana", size: 18))
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        BubbleView{
                            
                            if videoManager.news.count == 0 {
                                ProgressView()
                            }
                            else{
                                
                                LazyVStack{
                                    
                                    ForEach(videoManager.news){ newspaper in
                                        
                                        NavigationLink(
                                            destination: WebView(url: newspaper.url)){
                                                HorizontalNewsView(newspaper:newspaper)
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, UIScreen.main.bounds.height / 8.7)
                }
            }
                .background(
                    
                    VStack {
                        
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: Gradient(colors:
                                    [
                                        Color.darkGreen,
                                        Color.lightGreen
                                    ]),
                                startPoint: .bottomLeading, endPoint: .topTrailing))
                            .frame(height: UIScreen.main.bounds.height / 3)
                            .overlay(
                                
                                VStack{
                                    
                                    Spacer()
                                    
                                    Group{
                                        Text("It's A Great Day To")+Text("\nInvest!").bold()
                                    }
                                    .foregroundColor(.white)
                                    .font(.custom("Verdana", size: 24))
                                    .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                            )
                        
                        Spacer()
                    }
                )
                .overlay(
                    
                    VStack{
                        
                        HStack {
                            
                            Spacer()
                            
                            NavigationLink(
                                destination: WritersView()){
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.width / 12)
                                        .foregroundColor(.white)
                                        .padding([.trailing, .top], 25)
                                        .padding(.top, 20)
                            }
                        }
                        
                        Spacer()
                    }
            )
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
                
                self.videoManager.fetchSpecialVideo()
                
                self.videoManager.fetchSpecialArticle()

                self.videoManager.fetchNews()
            }
            .alert(isPresented: $notConnected) { 
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
