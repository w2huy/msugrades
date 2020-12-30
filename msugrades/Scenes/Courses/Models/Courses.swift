//
//  Courses.swift
//  msugrades
//
//  Created by William Huynh on 12/28/20.
//

import Foundation

struct Courses: Hashable, Codable {
    var courses: [Course]
    
}

struct Course: Hashable, Codable {
    var term: String
    var subject: String
    var code: Int
    var title: String
    var instructor: String
    var total: Int
    var average: Double
    var four: Int
    var threefive: Int
    var three: Int
    var twofive: Int
    var two: Int
    var onefive: Int
    var one: Int
    var zero: Int
    var incomplete: Int
    var withdrawn: Int
    var passed: Int
    var nograde: Int
    
}
