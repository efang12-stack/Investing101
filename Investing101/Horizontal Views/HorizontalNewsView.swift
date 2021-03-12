//
//  HorizontalNewsView.swift
//  Investing101
//
//  Created by Ethan on 2/24/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HorizontalNewsView: View {
    
    var newspaper: News
    
    var body: some View {
        VStack {
            
            HStack{
                
                Text(newspaper.title)
                    .font(.custom("Verdana", size: 14))
                    .bold()
                    .frame(width: 180)
                
                WebImage(url: URL(string: newspaper.image))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.height / 12.5, height: UIScreen.main.bounds.height / 12.5)
                    .cornerRadius(10)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.lightGray2)
                    .padding(.leading, 10)
            }
            .frame(height: UIScreen.main.bounds.height / 11)
            
            Divider()
        }
    }
}

struct HorizontalNewsView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalNewsView(newspaper: News(id: "", title: "", url: "", image: ""))
    }
}
