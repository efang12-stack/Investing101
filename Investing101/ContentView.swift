//
//  ContentView.swift
//  Investing101
//
//  Created by Ethan on 1/12/21.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            CoursesView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Courses")
                }
            
            ArticlesView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Articles")
                }
            
            ContactView()
                .tabItem {
                    Image(systemName: "phone")
                    Text("Contact Us")
                }

        }
        .accentColor(.black)
}
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
