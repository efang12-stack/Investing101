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
        Course(courseTitle: "Financial Literacy", image: "financiallit", description: "The course for financial literacy is learning how to effectively use financial skills.", dataKey: "videos"),
        Course(courseTitle: "Investing", image: "investing", description: "Investing is a course designed to learn how to spend money.", dataKey: "investment"),
        Course(courseTitle: "Entrepreneurship", image: "entrepreneur", description: "Entrepreneurship is a way to learn how to build a company.", dataKey: "entrepreneurship"),
        Course(courseTitle: "Professional Development", image: "development", description: "Professional development is a way to develop a company.", dataKey: "")
    ]
    
    @State var show = false
    @State var chosenCourse: Course = Course(courseTitle: "Financial Literacy", image: "financiallit", description: "The course for financial literacy is learning how to effectively use financial skills.", dataKey: "videos")
    
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
    
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView( chosenCourse: Course(courseTitle: "", image: "", description: "", dataKey: ""))
    }
}
