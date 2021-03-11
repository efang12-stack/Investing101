//
//  HorizontalResourceView.swift
//  Investing101
//
//  Created by Ethan on 3/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HorizontalResourceView: View {
    
    var resource: Resource
    var body: some View {
        
        VStack {
            
            HStack{
                
                Text(resource.name)
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 180)
                
                Image(resource.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.lightGray2)
                    .padding(.leading, 2)
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
