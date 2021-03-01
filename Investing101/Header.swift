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
    var padding: CGFloat
    
    init(padding: CGFloat, @ViewBuilder _ title:  () -> (TitleContent)) {
        self.title = title()
        self.padding = padding
    }
    
    var body: some View {
        
        HStack{
            title
        }
        .padding(.top, padding)
        .foregroundColor(.primary)
        .overlay(Rectangle()
        .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        .shadow(radius: 3)
        .edgesIgnoringSafeArea(.top))

        
    }
    
    
    
}
