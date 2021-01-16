//
//  VideosView.swift
//  Investing101
//
//  Created by Ethan on 1/16/21.
//

import SwiftUI
import AVKit

struct VideosView: View {
    
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
        }
        .onAppear() {
            self.videoManager.fetchData(collectionName: "videos")
        }
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
