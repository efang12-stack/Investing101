//
//  VideosView.swift
//  Investing101
//
//  Created by Ethan on 1/16/21.
//

import SwiftUI
import AVKit


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
                    
                        ProgressView()
                    
                        Spacer()
                    }
                }
                else{
                    
                    ScrollView(showsIndicators: false){
                    
                        VStack(spacing: 20){
                        
                            ForEach(videoManager.videos, id: \.id) { video in
                            
                                NavigationLink(destination: SingleVideoView(video: video)) {
                                    
                                    HorizontalVideosView(video: video)
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
            }
        }
        .ignoresSafeArea(edges: .top)
        .onAppear{
            self.videoManager.fetchVideos(collectionName: chosenCourse.dataKey)
           
        }
    }
}





struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView(chosenCourse: Course())
    }
}
