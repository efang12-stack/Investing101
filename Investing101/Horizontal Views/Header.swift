//
//  Header.swift
//  Investing101
//
//  Created by Ethan on 2/24/21.
//

import Foundation
import SwiftUI

struct Header<TitleContent: View> : View {
    
    var title: TitleContent
    
    init(@ViewBuilder _ title:  () -> (TitleContent)) {
        self.title = title()

    }
    
    var body: some View {
        
        HStack{
            
            title
        }
        .padding(.top, 30)
        .overlay(Rectangle()
        .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        .shadow(radius: 3)
        .edgesIgnoringSafeArea(.top))
        .background(
    
            Rectangle()
                .fill(Color.lightGray)
                .edgesIgnoringSafeArea(.top)
        )
    }
}
