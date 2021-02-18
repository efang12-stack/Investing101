//
//  SingleVideoView.swift
//  Investing101
//
//  Created by Ethan on 2/18/21.
//

import SwiftUI
import WebKit

struct SingleVideoView: View {
    
    var chosenVideo: Video
    
    var body: some View {
        

            
                VStack{
                
                    if let url = chosenVideo.url {
                        
                        Webview(url: url)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                    }

                
                    Text(chosenVideo.summary)
                        .multilineTextAlignment(.leading)
                
                    Spacer()
                }
                
                
            
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

struct SingleVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SingleVideoView(chosenVideo: Video(id: "", title: "", summary: "", url: "", image: ""))
    }
}
