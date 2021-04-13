//
//  HorizontalCourseSoonView.swift
//  Investing101
//
//  Created by Ethan on 4/2/21.
//

import SwiftUI

struct HorizontalCourseSoonView: View {
    
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
                        .frame(width: 215, alignment: .leading)
                        .padding(.bottom, 1)
                    
                    Text(course.description)
                        .font(.custom("Verdana", size: 14))
                        .foregroundColor(Color.darkGray)
                        .frame(width: 215, alignment: .leading)
                }
                
            }
            
            Divider()
                .padding(.top, 10)
                .padding(.bottom, 5)
        }
    }
}

struct HorizontalCourseSoonView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCourseSoonView(course: Course())
    }
}
