//
//  HomeView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
        ZStack(alignment: .leading) {
            GeometryReader{_ in
                VStack{
                    
                    ZStack{
                        
                        HStack{
                            
                            VStack {
                                Text("It's A Great Day To Invest")
                                    .font(.custom("Verdana", size: 25))
                                    .bold()
                                    .frame(width: 250)
                                    .padding(.bottom, 10)
                                
                                    
                                    
                                
                                
                            }
                            
                            Spacer()
                        }
                            
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                    .padding(.top, -75)
                    
                    
                    
                    HStack{
                        Text("Recent Videos")
                            .bold()
                            .foregroundColor(Color.darkGray)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
            
            
            
                    
                
            
            
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
