//
//  LoadingView.swift
//  Investing101
//
//  Created by Ethan on 1/26/21.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.gray, lineWidth: 2)
            .frame(width: 25, height: 25)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
    }
}

