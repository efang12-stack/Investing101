//
//  ContactView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        ScrollView{
            
            VStack {
                
                Text("Contact Us")
                    .font(.system(size: 35, weight: .bold))
                    .padding(.bottom, 3)
                    .padding(.top, 20)
                
                Text("Any questions or want to write for us? Write us a message!")
                    .font(.custom("Verdana", size: 17))
                    .foregroundColor(Color.darkGray)
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, -3)
                    
                
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
