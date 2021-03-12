//
//  BubbleView.swift
//  Investing101
//
//  Created by Ethan on 3/10/21.
//

import SwiftUI

struct BubbleView<TitleContent: View>: View {
    
    var title: TitleContent
    
    init(@ViewBuilder _ title:  () -> (TitleContent)) {
        self.title = title()

    }
    
    var body: some View {
        
        VStack{
            title
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: UIScreen.main.bounds.width / 1.1)
        .shadow(radius: 5)
    }
}


