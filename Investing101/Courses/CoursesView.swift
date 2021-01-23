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
    
    var courses: [Course] = [
        Course(courseTitle: "Financial Literacy", image: "financiallit", description: "A course over the foundations of personal financial literacy (saving, budgeting, loan management, investing, etc).", dataKey: "videos", colorBackground1: Color.litColor1, colorBackground2: Color.litColor2),
        Course(courseTitle: "Investing", image: "investing", description: "Introductory lessons over investing, equity analysis and other concepts to get you started in the stock market.", dataKey: "investment", colorBackground1: Color.investColor1, colorBackground2: Color.investColor2),
        Course(courseTitle: "Entrepreneurship", image: "entrepreneur", description: "Learn how to create your own business through lectures over idea valuation, operations, and cost-management.", dataKey: "entrepreneurship", colorBackground1: Color.entreColor1, colorBackground2: Color.entreColor2),
        Course(courseTitle: "Professional Development", image: "development", description: "Project yourself as professional through lessons that cover skills such as resume building, LinkedIn, interview skills, etc.", dataKey: "professional", colorBackground1: Color.profesColor1, colorBackground2: Color.profesColor2)
    ]
    
    @State var show = false
    @State var chosenCourse: Course = Course(courseTitle: "Financial Literacy", image: "financiallit", description: "The course for financial literacy is learning how to effectively use financial skills.", dataKey: "videos", colorBackground1: Color.blue, colorBackground2: Color.red)
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                    
                HStack{
                    Text("Courses")
                        .font(.system(size: 35, weight: .bold))
                        .padding([.leading, .bottom], 15)
                    
                
                    Spacer()
                }
                .overlay(Rectangle().stroke(Color.primary.opacity(0.3), lineWidth: 2).shadow(radius: 6).edgesIgnoringSafeArea(.top))
                .padding(.bottom, 20)
                .zIndex(1)
                
                ZStack{
                    NavigationLink(
                        destination: VideosView(chosenCourse: chosenCourse, show: $show),
                        isActive: self.$show,
                        label: {
                            Text("")
                        })
                    
                    ScrollView(.vertical){
                    
                        VStack(spacing: 20){
                        
                            ForEach(courses) { course in
                            
                                HStack{
                                    
                                    Image(course.image)
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 90, height: 110)
                                        .padding(.trailing, 20)
                                    
                                    VStack{
                                        Text(course.courseTitle)
                                            .font(.custom("Verdana", size: 15))
                                            .bold()
                                            .frame(maxWidth: 180, alignment: .leading)
                                            .padding(.bottom, 1)
                                        
                                        Text(course.description)
                                            .font(.custom("Verdana", size: 14))
                                            .foregroundColor(Color.darkGray)
                                            .frame(maxWidth: 180, alignment: .leading)
                                    }
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.leading, 15)
                                        .font(.headline)
                                
                                }
                                .onTapGesture {
                                    self.chosenCourse = course
                                    self.show.toggle()
                                }
                        }
                    }
                
                    Spacer()
                }
            }
        }
            .padding(.top, -60)
            .background(Color.lightGray)
            .edgesIgnoringSafeArea(.bottom)
        }
        
        
        
    }
}

struct Course: Identifiable {
    
    var id: String = UUID().uuidString
    var courseTitle: String
    var image: String
    var description: String
    var dataKey: String
    var colorBackground1: Color
    var colorBackground2: Color
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView( chosenCourse: Course(courseTitle: "", image: "", description: "", dataKey: "", colorBackground1: Color.blue, colorBackground2: Color.red))
    }
}
