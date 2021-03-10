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
                .foregroundColor(.lightGray2)
                .padding(.leading, 15)
                .font(.headline)
        }
    }
}

struct HorizontalCourseView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCourseView(course: Course())
    }
}
