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
    @Binding var show: Bool
    @ObservedObject var videoManager = VideoManager()
    
    var body: some View {
        VStack{
            if videoManager.videos.count == 0 {
                Text("Hi")
            }
            else{
                if let url = URL(string: videoManager.videos[0].url) {
                    VideoPlayer(player: AVPlayer(url: url))
                }
            }
            Text(chosenCourse.courseTitle)
        }
        .onAppear() {
            self.videoManager.fetchData(collectionName: chosenCourse.dataKey)
        }
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView(chosenCourse: Course(courseTitle: "", image: "", description: "", dataKey: ""), show: .constant(true))
    }
}
