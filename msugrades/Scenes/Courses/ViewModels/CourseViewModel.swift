//
//  CourseViewModel.swift
//  msugrades
//
//  Created by William Huynh on 1/1/21.
//

import SwiftUI

class CourseViewModel: ObservableObject {
    
    @Published var course: Course
    
    init(course: Course) {
        self.course = course
    }
    
    func getInstructors() -> String {
        let str = course.instructor
        if str == "NULL" || str == "" {
            return "ONLINE"
        }
        let replaced = str.replacingOccurrences(of: " | ", with: "\n")
        return replaced
    }
    
    func getTerm() -> String {
        switch course.term {
        case let str where str.contains("FS"):
            return "Fall 20\(str.suffix(2))"
        case let str where str.contains("SS"):
            return "Spring 20\(str.suffix(2))"
        case let str where str.contains("US"):
            return "Summer 20\(str.suffix(2))"
        default:
            return "Date Error"
        }
    }
    
    func getTermColor() -> Color {
        switch course.term {
        case let str where str.contains("FS"):
            return Color.orange
        case let str where str.contains("SS"):
            return Color.green
        case let str where str.contains("US"):
            return Color.blue
        default:
            return Color.purple
        }
    }
    
    func getColor(value: Double) -> Color {
        switch value {
        case 4.0 :
            return Color.fourGreen
        case 3.5..<4.0 :
            return Color.threefiveGreen
        case 3.0..<3.5 :
            return Color.threeGreen
        case 2.5..<3.0 :
            return Color.twofiveYellow
        case 2.0..<2.5 :
            return Color.twoYellow
        case 1.5..<2.0 :
            return Color.onefiveOrange
        case 1.0..<1.5 :
            return Color.oneOrange
        case 0.0..<1.0 :
            return Color.zeroRed
        default:
            return Color.gray
        }
    }
    
    func getMedian() -> Double {
        let course = self.course
        let dict = [
            "4.0": course.four,
            "3.5": course.threefive,
            "3.0": course.three,
            "2.5": course.twofive,
            "2.0": course.two,
            "1.5": course.onefive,
            "1.0": course.one,
            "0.0": course.zero
        ]
        
        var sum = 0
        for value in dict.values {
            sum += value
        }
        
        var medianIndex = sum / 2
        
        let sortedKeys = dict.sorted{ $0.key > $1.key }
        
        var previous = ""
        for i in sortedKeys {
            if medianIndex <= 0 {
                return Double(previous) ?? 0.0
            }
            else {
                medianIndex -= i.value
                previous = i.key
            }
        }
        
        return Double(previous) ?? 0.0
    }
    
    
}
