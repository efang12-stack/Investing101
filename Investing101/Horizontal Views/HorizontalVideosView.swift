//
//  HorizontalVideosView.swift
//  Investing101
//
//  Created by Ethan on 2/24/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HorizontalVideosView: View {
    
    var video: Video
    
    var body: some View {
        
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

struct HorizontalVideosView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalVideosView(video: Video(id: "", title: "", summary: "", url: "", image: ""))
    }
}
