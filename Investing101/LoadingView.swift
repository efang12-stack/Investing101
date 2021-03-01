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
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
    }
}

