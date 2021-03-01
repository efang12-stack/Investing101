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
        HStack{
            
            Text(newspaper.title)
                .font(.system(size: 23, weight: .bold))
                .frame(width: 230, height: 200, alignment: .leading)
                .padding(.leading, 15)
            
            WebImage(url: URL(string: newspaper.image))
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(.trailing, 15)
        }
    }
}

struct HorizontalNewsView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalNewsView(newspaper: News(id: "", title: "", url: "", image: ""))
    }
}
