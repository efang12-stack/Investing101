//
//  HomeView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI


struct HomeView: View {
    
    @ObservedObject var videoManager = VideoManager()
    
  
    
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
                                
                                Text("Saved Courses")
                                    .bold()
                                    .foregroundColor(Color.darkGray)
                                    .padding(.leading)
                            
                                Spacer()
                            }
                            .padding(.top, 10)
                            
                            
                        
                            Spacer()
                            
                            
                        }
                    }
                    .onAppear() {
                        self.videoManager.fetchData(collectionName: "special")
                       
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
