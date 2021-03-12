//
//  HorizontalWriterView.swift
//  Investing101
//
//  Created by Ethan on 3/11/21.
//

import SwiftUI

struct HorizontalWriterView: View {
    
    var image: String
    var name: String
//    var link: String
    var body: some View {
        
        VStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 140)
                .cornerRadius(5)
            
            Text(name)
                .font(.custom("Verdana", size: 14))
                .foregroundColor(.black)
                .padding(.bottom, 3)
            
//            Link(destination: URL(string: link)!, label: {
//                
//                HStack {
//                    Text("LinkedIn")
//                        .font(.custom("Verdana", size: 16))
//                        .foregroundColor(Color.darkBlue)
//                    
//                    
//                    
//                    Image("linkedin")
//                        .resizable()
//                        .frame(width: 43, height: 35)
//                }
//            })
        }
    }
}

struct HorizontalWriterView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalWriterView(image: "", name: "")
    }
}
