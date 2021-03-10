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
    @State var chosenCourse: Course = Course()
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                Header{
                    
                    Text("Courses")
                        .font(.system(size: 35, weight: .bold))
                        .padding([.leading, .bottom], 15)
                    
                    Spacer()
                }
                
                ZStack{
                    
                    ScrollView(.vertical){
                    
                        VStack(spacing: 20){
                        
                            ForEach(courses) { course in
                                
                                NavigationLink(destination: VideosView(chosenCourse: course)) {
                                    HorizontalCourseView(course: course)
                                }
                            }
                        }
                
                        Spacer()
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        } 
    }
}





struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView( chosenCourse: Course())
    }
}
