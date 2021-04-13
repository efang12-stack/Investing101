//
//  HorizontalWriterView.swift
//  Investing101
//
//  Created by Ethan on 3/11/21.
//

import SwiftUI

struct HorizontalWriterView: View {
    
    var image1: String
    var name1: String
    var image2: String
    var name2: String
    
    var body: some View {
        
        HStack(spacing: UIScreen.main.bounds.width * (1/5)){
            
            VStack{
                
                Image(image1)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 140)
                    .clipped()
                    .cornerRadius(5)
                
                Text(name1)
                    .font(.custom("Verdana", size: 14))
                    .frame(width: 110)
                    .foregroundColor(.black)
                    .padding(.bottom, 3)
            }
            
            VStack{
                
                Image(image2)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 140)
                    .clipped()
                    .cornerRadius(5)
                
                Text(name2)
                    .font(.custom("Verdana", size: 14))
                    .frame(width: 110)
                    .foregroundColor(.black)
                    .padding(.bottom, 3)
            }
        }
        .padding(.bottom, 20)
    }
}

struct HorizontalWriterView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalWriterView(image1: "", name1: "", image2: "", name2: "")
    }
}
