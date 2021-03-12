//
//  ArticleCourseView.swift
//  Investing101
//
//  Created by Ethan on 3/11/21.
//

import SwiftUI

struct ArticleCourseView: View {
    
    var courses: [Course] = [
        Course(courseTitle: "Personal Financial Literacy", image: "personalfin", description: "Here we go over the fundamentals of personal financial literacy, bringing light to topics such as savings account, reconciling a bank statement, and more.", colorBackground1: Color.personalfinColor2, colorBackground2: Color.personalfinColor1),
        Course(courseTitle: "Investing Techniques", image: "investtech", description: "A selection of articles that covers technical analysis conducted on securities in the process of trading based off of a set strategy. ", colorBackground1: Color.investtechColor1, colorBackground2: Color.investtechColor2),
        Course(courseTitle: "Cryptocurrency", image: "crypto", description: "Here we cover opportunities and concepts to consider when taking a look at the DeFi asset market.", colorBackground1: Color.litColor1, colorBackground2: Color.litColor2),
        Course(courseTitle: "Professional Development", image: "prodev", description: "A set of articles covering everything from how to properly use LinkedIn, to how to prepare for a technical interview.", colorBackground1: Color.investColor1, colorBackground2: Color.investColor2),
        Course(courseTitle: "Market Opportunities", image: "marketopp", description: "A collection of due-diligence type articles that provide an in-depth technical and fundamental analysis of entire sectors or individual entities.", colorBackground1: Color.marketColor2, colorBackground2: Color.marketColor1),
        Course(courseTitle: "Quantitative Finance", image: "quantfin", description: "Here we analyze securities from a quant standpoint, putting together the foundations of math, statistics, computer programming, and machine learning to find profits in investment strategies.", colorBackground1: Color.quantColor1, colorBackground2: Color.quantColor2)
    ]
    var body: some View {
        NavigationView{
            
            VStack{
                
                Header{
                    
                    Text("Articles")
                        .font(.system(size: 35, weight: .bold))
                        .padding([.leading, .bottom], 15)
                    
                    Spacer()
                }
                
                ZStack{
                    
                    ScrollView(.vertical){
                    
                        VStack(spacing: 20){
                        
                            ForEach(courses) { course in
                                
                                NavigationLink(destination: ArticleView(chosenCourse: course)) {
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

struct ArticleCourseView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCourseView()
    }
}
