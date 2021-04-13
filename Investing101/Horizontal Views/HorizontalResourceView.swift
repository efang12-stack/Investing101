//
//  HorizontalResourceView.swift
//  Investing101
//
//  Created by Ethan on 3/10/21.
//

import SwiftUI


struct HorizontalResourceView: View {
    
    var resource: Resource
    var body: some View {
        
        VStack {
            
            HStack{
                
                Text(resource.name)
                    .font(.custom("Verdana", size: 18))
                    .bold()
                    .frame(width: 180)
                
                Image(resource.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.height * (2/25), height: UIScreen.main.bounds.height * (2/25))
                    .clipped()
                    .cornerRadius(10)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.lightGray2)
                    .padding(.leading, 10)
            }
            .padding(.top, 2)
            .frame(height: UIScreen.main.bounds.height / 11)
            
            Divider()
        }
    }
}

struct HorizontalResourceView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalResourceView(resource: Resource())
    }
}
