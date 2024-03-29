//
//  HorizontalCourseView.swift
//  Investing101
//
//  Created by Ethan on 2/24/21.
//

import SwiftUI

struct HorizontalCourseView: View {
    
    var course: Course
    
    var body: some View {
        
        VStack {
            
            HStack{
                
                Image(course.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.trailing, 20)
                
                
                VStack{
                    Text(course.courseTitle)
                        .font(.custom("Verdana", size: 15))
                        .bold()
                        .frame(width: 180, alignment: .leading)
                        .padding(.bottom, 1)
                    
                    Text(course.description)
                        .font(.custom("Verdana", size: 14))
                        .foregroundColor(Color.darkGray)
                        .frame(width: 180, alignment: .leading)
                }
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.lightGray2)
                    .padding(.leading, 15)
                    .font(.headline)
            }
            
            Divider()
                .padding(.top, 10)
                .padding(.bottom, 5)
        }
    }
}

struct HorizontalCourseView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCourseView(course: Course())
    }
}
