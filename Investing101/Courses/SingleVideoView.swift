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
                    
                    
                    ScrollView{

                            VStack{
                            
                                    HStack{
                                        
                                        Text(chosenVideo.title)
                                            .font(.custom("Verdana", size: 20))
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, 17)
                                        
                                        Spacer()
                                    }
                                    .padding(.bottom, 1)
                                
                                    Text(chosenVideo.summary)
                                        .font(.custom("San Francisco", size: 18))
                                        .multilineTextAlignment(.leading)
                                
                                    Spacer()
                            }
                    }
                    
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
