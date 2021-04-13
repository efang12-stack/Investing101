//
//  HorizontalDeveloperView.swift
//  Investing101
//
//  Created by Ethan on 3/8/21.
//

import SwiftUI

struct HorizontalDeveloperView: View {
    var image: String
    var name: String
    var description: String
    var email: String
    var link: String
    
    var body: some View {
        
        VStack {
            
            HStack{
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .clipped()
                    .cornerRadius(5)
                    .padding(.leading, 20)
                
                VStack{
                    
                    Text(name)
                        .bold()
                        .font(.custom("Verdana", size: 18))
                        .foregroundColor(.black)
                        .frame(width: 230, alignment: .leading)
                        .padding(.bottom, 3)
                    
                    Text(description)
                        .font(.custom("Verdana", size: 11))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(width: 230)
                }
                .frame(height: 120)
                .padding(.leading, 2)
            }
            .padding(.bottom, 5)
            
            Text("Email: \(email)")
                .font(.custom("Verdana", size: 15))
                .foregroundColor(.black)
                .frame(width: 270)
            
            Link(destination: URL(string: link)!){
                
                HStack {
                    Text("LinkedIn")
                        .font(.custom("Verdana", size: 18))
                        .foregroundColor(Color.darkBlue)
                    
                    Image("linkedin")
                        .resizable()
                        .frame(width: 45, height: 37)
                }
            }
        }
        .padding(.bottom, 5)
    }
}

struct HorizontalDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDeveloperView(image: "", name: "", description: "", email: "", link: "")
    }
}
