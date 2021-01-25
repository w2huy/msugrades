//
//  YourCoursesViewModel.swift
//  msugrades
//
//  Created by William Huynh on 1/24/21.
//

import Foundation

class YourCoursesViewModel: ObservableObject {
    
    @Published var courses = [Course]()
    
    func getYearSections() -> [String] {
        var years = Set<String>()
        for course in courses {
            years.insert(course.term)
        }
        return Array(years)
    }

    func getTerm(year: String) -> String {
        switch year {
        case let str where year.contains("FS"):
            return "Fall 20\(str.suffix(2))"
        case let str where year.contains("SS"):
            return "Spring 20\(str.suffix(2))"
        case let str where year.contains("US"):
            return "Summer 20\(str.suffix(2))"
        default:
            return "Date Error"
        }
    }
}
