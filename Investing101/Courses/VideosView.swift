//
//  VideosView.swift
//  Investing101
//
//  Created by Ethan on 1/16/21.
//

import SwiftUI
import AVKit
import SDWebImageSwiftUI

struct VideosView: View {
    @State var chosenCourse: Course
    @ObservedObject var videoManager = VideoManager()
    @ObservedObject var savedVideoManager = SavedVideoManager()
    
    var body: some View {
        
        VStack{
                
                HStack {
                        
                        Text(chosenCourse.courseTitle)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .padding([.bottom, .leading], 10)
                            
                    Spacer()
                            
                    Button(action: {
                        
                        savedVideoManager.setCourseNames()
                        
                        if !savedVideoManager.savedCourseNames.contains(chosenCourse.courseTitle) {
                            
                            savedVideoManager.saveCourse(withCourse: chosenCourse.courseTitle)
                        
                            savedVideoManager.setCourseNames()
                        
                        }
                        else {
                            
                            savedVideoManager.deleteCourse(withCourse: chosenCourse.courseTitle)
                            
                            savedVideoManager.setCourseNames()
                            
                        }
                        
                    }, label: {
                        
                        if savedVideoManager.savedCourseNames.contains(chosenCourse.courseTitle) {
                            
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(.white)
                                .font(.custom("Arial", size: 30))
                                .padding(.trailing,10)
                                .padding(.bottom, 10)
                        }
                        else {
                            
                            Image(systemName: "bookmark")
                                .foregroundColor(.white)
                                .font(.custom("Arial", size: 30))
                                .padding(.trailing,10)
                                .padding(.bottom, 10)
                        }
                        
                    })
                    .onAppear{
                        
                        savedVideoManager.setCourseNames()
                    }
                    
                    
                }
                .padding(.top, 90)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(LinearGradient(gradient: Gradient(colors: [chosenCourse.colorBackground1, chosenCourse.colorBackground2]), startPoint: .trailing, endPoint: .leading))
                

            
                if videoManager.videos.count == 0 {
                    
                    VStack{
                    
                        LoadingView()
                    
                        Spacer()
                    }
                    
                }
                else{
                    
                    ScrollView(showsIndicators: false){
                    
                        VStack(spacing: 20){
                        
                            ForEach(videoManager.videos, id: \.id) { video in
                            
                                NavigationLink(destination: SingleVideoView(chosenVideo: video)) {
                                    
                                        
                                            HStack{
                                        
                                                
                                                WebImage(url: URL(string: video.image))
                                                    .resizable()
                                                    .frame(width: 170, height: 100)
                                                    .cornerRadius(10)
                                            
                                                VStack{
                                                    
                                                    Text(video.title)
                                                        .bold()
                                                        .font(.custom("Verdana", size: 14))
                                                        .multilineTextAlignment(.leading)
                                                        .frame(width: 165)
                                                        
                                            
                                                    Text(video.summary)
                                                        .font(.custom("Verdana", size: 14))
                                                        .multilineTextAlignment(.leading)
                                                        .lineLimit(3)
                                                        .foregroundColor(.darkerGray)
                                                        .frame(width: 165)
                                                        .multilineTextAlignment(.center)
                                                        .padding(.bottom, 20)
                                            
                                                }
                                                
                                                                    
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(Color.lightGray2)
                                        
                                            }
                                            

                                        
                                    
                            }
                                
                               
                        }
                            
                    }
                        
                    
                }
                .padding(.top, 10)
               
            }
            
        }
        .ignoresSafeArea( edges: .top)
        .onAppear() {
            self.videoManager.fetchData(collectionName: chosenCourse.dataKey)
           
        }
        
    }
}





struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView(chosenCourse: Course(courseTitle: "", image: "", description: "", dataKey: "", colorBackground1: Color.blue, colorBackground2: Color.red))
    }
}
