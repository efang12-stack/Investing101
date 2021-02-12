//
//  NewsDisplay.swift
//  Investing101
//
//  Created by Ethan on 2/8/21.
//

import SwiftUI

struct NewsDisplay: View {
    
    @State var url: String
    var body: some View {
        Webview(url: url)
    }
}

struct NewsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        NewsDisplay(url: "")
    }
}
