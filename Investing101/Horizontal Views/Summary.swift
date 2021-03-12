//
//  Summary.swift
//  Investing101
//
//  Created by Ethan on 2/28/21.
//

import SwiftUI

struct Summary: View {
    
    var description: String
    var title: String
    var body: some View {
        
        VStack{
        
            HStack{
                
                Text(title)
                    .font(.custom("Verdana", size: 20))
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 17)
                
                Spacer()
            }
            .padding(.bottom, 1)
        
            HStack{
                
                Text(description)
                    .font(.custom("Verdana", size: 16))
                    .multilineTextAlignment(.leading)
                    .frame(width: 350)
                    .padding(.leading, 15)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary(description: "", title: "")
    }
}
