//
//  DisplayView.swift
//  Investing101
//
//  Created by Ethan on 1/22/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DisplayView: View {
    
    @State var chosenArticle: Article
   
    
    var body: some View {
        
    
            
                VStack{
                    
                    HStack {
                        Spacer()
                        
                        Text(chosenArticle.category)
                            .foregroundColor(Color.black)
                            .font(.system(size: 17))
                            .bold()
                            .shadow(radius: 3)
                            .padding(.bottom, 20)
                        
                       Spacer()
                            
                    }
                    .padding(.top, 15)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.lightGray)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.3), lineWidth: 2).shadow(radius: 10).edgesIgnoringSafeArea(.top))
                    
                    
            
                    ScrollView{
                
                        VStack {
                
                                    
                            Text(chosenArticle.title)
                                .font(.custom("Arial", size: 30))
                                .bold()
                                .padding([.leading,.trailing], 30)
                                
                
                            WebImage(url: URL(string: chosenArticle.image))
                                .resizable()
                                .frame(width: 350, height: 250)
                                .cornerRadius(5)
                
                            HStack {
                                
                                Text("by "+(chosenArticle.author))
                                    .foregroundColor(Color.darkerGray)
                                    .font(.custom("Verdana", size: 18))
                                    .padding([.bottom, .leading], 30)
                                    .padding(.top, 5)
                                
                                Spacer()
                            }
                
                            Text(chosenArticle.text)
                                .font(.custom("Times New Roman", size: 23))
                                .padding([.leading, .trailing], 20)
                
                            Spacer()
                        }
                    }
                    .padding(.top, 40)
                    .zIndex(1)
        
                }
                .ignoresSafeArea(.all, edges: .top)
               
        
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(chosenArticle: Article(title: "How to Build A Company", text: "This is the first part to building a company", image: "", category: "Fin Tech", author: "Ethan Fang"))
    }
}
