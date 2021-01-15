//
//  ContentView.swift
//  Investing101
//
//  Created by Ethan on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    var body: some View {
        Home()
}
}

struct Home: View {
    @State var show = false
    var body: some View{
        ZStack(alignment: .leading) {
            GeometryReader{_ in
                VStack{
                    
                    ZStack{
                        HStack{
                            
                            Button(action: {
                                withAnimation(.default){
                                    self.show.toggle()
                                }
                            }, label: {
                                Image(systemName: "line.horizontal.3")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            })
                            
                            Spacer()
                        }
                        
                        Text("Courses")
                            .bold()
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                    
                    Spacer()
                    
                   Text("Dark Mode Menu")
                    
                    Spacer()
                }
            }
            
            
            HStack {
                Menu(show: $show)
                    .offset(x: self.show ? 0 : -UIScreen.main.bounds.width / 1.7)
            }
                    
                
            
            
        }
    }
}

struct Menu: View {
    
    @Binding var show: Bool
    
    var body: some View{
        VStack{
            
            HStack{
                Button(action: {
                    withAnimation(.default){
                        self.show.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 12, height: 20)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                })
                
            }
            .padding(.top, 50)
            .padding(.bottom, 25)
            
            Group {
                Button(action: {
                    
                }, label: {
                    HStack(spacing: 22){
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        Text("Home")
                        
                        
                    }
                    .padding(.trailing, 50)
                })
                .padding(.top, 25)
                
                Button(action: {
                    
                }, label: {
                    HStack(spacing: 22){
                        Image(systemName: "newspaper")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        Text("Articles")
                        
                        
                    }
                    .padding(.trailing, 40)
                })
                .padding(.top, 25)
                
                Button(action: {
                    
                }, label: {
                    HStack(spacing: 18){
                        Image(systemName: "phone")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        Text("Contact Us")
                            
                            
                    }
                    .padding(.trailing, 15)
                })
                .padding(.top, 25)
            }
            
            Spacer()
            
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.7)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
