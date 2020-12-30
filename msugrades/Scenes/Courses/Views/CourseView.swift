//
//  CourseView.swift
//  msugrades
//
//  Created by William Huynh on 12/29/20.
//

import SwiftUI

struct CourseView: View {
    
    var course: Course
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Info
                Text("Course Title: \(course.title)")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                Text("Instructor: \(course.instructor)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemGray))
                
                
                // Statistics
                HStack {
                    
                    ZStack {
                        Color(.systemGray6)
                        
                        VStack {
                            Text("\(course.average, specifier: "%.2f")")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                            Text("AVERAGE")
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        
                    }.cornerRadius(3)
                    
                    ZStack {
                        Color(.systemGray6)
                        
                        VStack {
                            Text("\(course.total)")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                            Text("TOTAL")
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        
                    }.cornerRadius(3)
                    
                }
                
                
                // Bar Chart
                HStack(alignment: .bottom, spacing: 4) {
                    
                    Bar(gpa: course.four, total: course.total, color: .green, score: "4.0", height: 900, showCounts: true)
                    Bar(gpa: course.threefive, total: course.total, color: .green, score: "3.5", height: 900, showCounts: true)
                    Bar(gpa: course.three, total: course.total, color: .green, score: "3.0", height: 900, showCounts: true)
                    Bar(gpa: course.twofive, total: course.total, color: .yellow, score: "2.5", height: 900, showCounts: true)
                    Bar(gpa: course.two, total: course.total, color: .yellow, score: "2.0", height: 900, showCounts: true)
                    Bar(gpa: course.onefive, total: course.total, color: .red, score: "1.5", height: 900, showCounts: true)
                    Bar(gpa: course.one, total: course.total, color: .red, score: "1.0", height: 900, showCounts: true)
                    Bar(gpa: course.zero, total: course.total, color: .red, score: "0.0", height: 900, showCounts: true)
                    
                    Bar(gpa: course.withdrawn, total: course.total, color: .blue, score: "W", height: 900, showCounts: true)
                    Bar(gpa: course.incomplete, total: course.total, color: .purple, score: "I", height: 900, showCounts: true)
                    
                }
                .frame(height: 300)
                
                
                
            }
            .padding()
        }
        .navigationTitle("\(course.term) - \(course.subject) \(course.code)")
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: Course(term: "SS20", subject: "CSE", code: 325, title: "Computer Systems", instructor: "MCCULLEN,MARK H", total: 183, average: 2.546448087, four: 37, threefive: 17, three: 29, twofive: 32, two: 28, onefive: 17, one: 10, zero: 13, incomplete: 0, withdrawn: 0, passed: 0, nograde: 0))
    }
}
