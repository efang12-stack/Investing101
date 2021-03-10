//
//  SingleVideoView.swift
//  Investing101
//
//  Created by Ethan on 2/18/21.
//

import SwiftUI
import WebKit

struct SingleVideoView: View {
    
    var video: Video
    
    var body: some View {
                  
            VStack{
                
                if let url = video.url {
                    
                    WebView(url: url)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                }
                    
                ScrollView{

                    VStack {
                        Summary(description: video.summary, title: "Summary:")
                            .padding(.bottom, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.lightGray)
                    
                    Summary(description: video.objectives, title: "Objectives:")
                }
            }
    }
}




struct SingleVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SingleVideoView(video: Video())
    }
}
