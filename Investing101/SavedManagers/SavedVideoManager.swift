//
//  SavedVideoManager.swift
//  Investing101
//
//  Created by Ethan on 1/31/21.
//

import Foundation
import SwiftUI

class SavedVideoManager: ObservableObject {
    
    @Published var savedCourseNames = [String]()
    @Published var savedCourses = [Course]()
    let defaults = UserDefaults.standard
    
    var courses: [Course] = [
        Course(courseTitle: "Financial Literacy", image: "financiallit", description: "A course over the foundations of personal financial literacy (saving, budgeting, loan management, investing, etc).", dataKey: "videos", colorBackground1: Color.litColor1, colorBackground2: Color.litColor2),
        Course(courseTitle: "Investing", image: "investing", description: "Introductory lessons over investing, equity analysis and other concepts to get you started in the stock market.", dataKey: "investment", colorBackground1: Color.investColor1, colorBackground2: Color.investColor2),
        Course(courseTitle: "Entrepreneurship", image: "entrepreneur", description: "Learn how to create your own business through lectures over idea valuation, operations, and cost-management.", dataKey: "entrepreneurship", colorBackground1: Color.entreColor1, colorBackground2: Color.entreColor2),
        Course(courseTitle: "Professional Development", image: "development", description: "Project yourself as professional through lessons that cover skills such as resume building, LinkedIn, interview skills, etc.", dataKey: "professional", colorBackground1: Color.profesColor1, colorBackground2: Color.profesColor2)
    ]
    
    
    init() {
        setCourseNames()
    }
    
    func setCourseNames() {
        if let defaultCourses = defaults.stringArray(forKey: "savedCourseNames"){
            savedCourseNames = defaultCourses
        } else {
            savedCourseNames = []
        }
    }
    
    func saveCourse(withCourse course: String) {
        savedCourseNames.append(course)
        defaults.setValue(savedCourseNames, forKey: "savedCourseNames")
    }
    
    func deleteCourse(withCourse course: String) {
        guard let index = savedCourseNames.firstIndex(of: course) else { fatalError("No index found") }
        savedCourseNames.remove(at: index)
        defaults.setValue(savedCourseNames, forKey: "savedCourseNames")
    }
    
    func getSavedCourses() {
        
        savedCourses = []
        
        for course in courses {
            if savedCourseNames.contains(course.courseTitle) {
                savedCourses.append(course)
            }
        }
    }

    
}
