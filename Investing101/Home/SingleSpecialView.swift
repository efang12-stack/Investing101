//
//  SingleSpecialView.swift
//  Investing101
//
//  Created by Ethan on 3/10/21.
//

import SwiftUI

struct SingleSpecialView: View {
    
    var video: Video
    
    var body: some View {
        VStack{
            
            if let url = video.url {
                
                WebView(url: url)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
            }
                
            ScrollView{

                Summary(description: video.summary, title: "Summary:")
            }
            .background(Color.lightGray)
        }
    }
}

struct SingleSpecialView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSpecialView(video: Video())
    }
}
