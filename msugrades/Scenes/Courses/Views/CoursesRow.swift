//
//  CoursesRow.swift
//  msugrades
//
//  Created by William Huynh on 12/29/20.
//

import SwiftUI

struct CoursesRow: View {
    
    var course: Course
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    
                    Text("\(course.term)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(course.term.contains("FS") ? .orange : .green)
                        .padding(8)
                        .background(Capsule().stroke(course.term.contains("FS") ? Color.orange : Color.green,lineWidth: 2))
                    
                    Text("\(course.subject) \(course.code)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color(.darkGray))
                        .padding(8)
                        .background(Capsule().stroke(Color(.darkGray),lineWidth: 2))
                    
                    Spacer()
                    
                    Text("\(course.instructor)")
                        .font(.headline)
                    
                }
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(course.total) - total students")
                            .font(.subheadline)
                            .foregroundColor(Color(.systemGray))
                    }
                }
            }
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 4) {
                
                Bar(gpa: course.four, total: course.total, color: .green, score: "4.0", height: 300)
                Bar(gpa: course.threefive, total: course.total, color: .green, score: "3.5", height: 300)
                Bar(gpa: course.three, total: course.total, color: .green, score: "3.0", height: 300)
                
                Bar(gpa: course.twofive, total: course.total, color: .yellow, score: "2.5", height: 300)
                Bar(gpa: course.two, total: course.total, color: .yellow, score: "2.0", height: 300)
                Bar(gpa: course.onefive, total: course.total, color: .red, score: "1.5", height: 300)
                Bar(gpa: course.one, total: course.total, color: .red, score: "1.0", height: 300)
                Bar(gpa: course.zero, total: course.total, color: .red, score: "0.0", height: 300)
                
            }
            
            
        }
        .frame(height: 150)
        .padding()
    }
}

struct CoursesRow_Previews: PreviewProvider {
    static var previews: some View {
        CoursesRow(course: Course(term: "SS20", subject: "CSE", code: 325, title: "Computer Systems", instructor: "MCCULLEN,MARK H", total: 183, average: 2.546448087, four: 37, threefive: 17, three: 29, twofive: 32, two: 28, onefive: 17, one: 10, zero: 13, incomplete: 0, withdrawn: 0, passed: 0, nograde: 0))
    }
}
