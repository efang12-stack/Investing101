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
                        
                        Text("Last Month's News:")
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        VStack{
                            
                            if videoManager.news.count == 0 {
                                LoadingView()
                            }
                            else{
                                
                                LazyVStack{
                                    
                                    ForEach(videoManager.news) { newspaper in
                                        
                                        NavigationLink(
                                            destination: WebView(url: newspaper.url),
                                            label: {
                                                HorizontalNewsView(newspaper: newspaper)
                                            })
                                    }
                                }
                            }
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .shadow(radius: 5)
                        .padding(.bottom, 30)
                    }
                    
                    VStack {
                        
                        Spacer()
                        
                        Text("Video of the Month:")
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        VStack{
                            
                            if let video = videoManager.specialVideo.first {
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
                                            .frame(height: UIScreen.main.bounds.height / 10.5)
                                        })
                                }
                            }
                            else {
                                
                                LoadingView()
                            }
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .shadow(radius: 5)
                    }
                    .padding(.bottom, UIScreen.main.bounds.height / 7.8)
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
