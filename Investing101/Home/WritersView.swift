//
//  WritersView.swift
//  Investing101
//
//  Created by Ethan on 3/11/21.
//

import SwiftUI

struct WritersView: View {
    
    
    var body: some View {
        
        VStack {
            
            ScrollView(showsIndicators: false){
                
                Text("Meet The Developers")
                    .font(.custom("Verdana", size: 17))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.vertical, 20)
                
                HorizontalDeveloperView(image: "ethan", name: "Ethan Fang", description: "I am a student at Lebanon Trail High School in Plano, Texas with a passion for computer science and finance. Currently, I am pursuing many coding projects and applications and look to major in computer science.", email: "ethanfang10@gmail.com", link: "https://www.linkedin.com/in/ethan-fang-bb0404161/")
                    .padding(.bottom, 20)
                  
                HorizontalDeveloperView(image: "aayush", name: "Aayush Kadakia", description: "I am a student at Lebanon Trail High School in Plano, Texas with a passion for fin-tech and psychology. Currently, I am pursuing ventures in algorithmic trading and finance.", email: "kadakiaaayush@gmail.com", link: "https://www.linkedin.com/in/aayush-kadakia-7939531ba/")
                    .padding(.bottom, 20)
                
                Text("Meet The Writers")
                    .font(.custom("Verdana", size: 17))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.bottom, 20)
                
                HStack(spacing: UIScreen.main.bounds.width / 5){
                    
                    HorizontalWriterView(image: "krishna", name: "Krishna Madhav")
                    
                    HorizontalWriterView(image: "gaurav", name: "Gaurav Srivatchan")
                    
                    
                }

            }
        }
        .navigationBarTitle("Meet the Team", displayMode: .inline)
        .padding(.top, 10)
    }
}

struct WritersView_Previews: PreviewProvider {
    static var previews: some View {
        WritersView()
    }
}
