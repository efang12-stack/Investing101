//
//  VideosView.swift
//  Investing101
//
//  Created by Ethan on 1/16/21.
//

import SwiftUI
import AVKit
import WebKit

struct VideosView: View {
    @State var chosenCourse: Course
    @Binding var show: Bool
    @ObservedObject var videoManager = VideoManager()
    
    var body: some View {
        VStack{
                
                HStack {
                        
                        Text(chosenCourse.courseTitle)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .padding([.bottom, .leading], 10)
                            
                            
                        Spacer()
                }
                .padding(.top, 60)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(LinearGradient(gradient: Gradient(colors: [chosenCourse.colorBackground1, chosenCourse.colorBackground2]), startPoint: .trailing, endPoint: .leading))
                  
                    
                   
                    
                
            
            
            if videoManager.videos.count == 0 {
                VStack{
                Text("Loading Videos")
                    
                    Spacer()
                }
            }
            else{
                ScrollView{
                    
                    VStack(spacing: 20){
                        
                        ForEach(videoManager.videos, id: \.id) { video in
                            
                            HStack{
                                
                                if let url = video.url {
                                    
                                        Webview(url: url)
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
                        }
                    }
                    
                }
                .padding(.top, 10)
               
            }
            
        }
        .onAppear() {
            self.videoManager.fetchData(collectionName: chosenCourse.dataKey)
           
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Webview: UIViewRepresentable {
    
    
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<Webview>) {
        
    }
}



struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView(chosenCourse: Course(courseTitle: "", image: "", description: "", dataKey: "", colorBackground1: Color.blue, colorBackground2: Color.red), show: .constant(true))
    }
}
