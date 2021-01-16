//
//  CoursesView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI
import Firebase
import AVKit

struct CoursesView: View {
    
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                    
                HStack{
                    Text("Courses")
                        .font(.system(size: 35, weight: .bold))
                        .padding(.leading, 15)
                
                    Spacer()
                }
                
                ScrollView(.vertical){
                    
                    NavigationLink(
                        destination: VideosView(),
                        label: {
                            Text("Navigate")
                        })
                
                    Spacer()
                }
            }
            .padding(.top, -60)
        }
        
        
        
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
