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
        
        ZStack {
            
            // Background
            Color.white.opacity(0.00001)
            
            VStack {
                HStack(alignment: .top) {
                    
                    Text("\(course.term)")
                        .font(.subheadline)
                        .foregroundColor(course.term.contains("FS") ? Color.orange : (course.term.contains("SS") ? Color.green : Color.blue))
                        .padding(8)
                        .background(
                            Capsule()
                                .stroke(course.term.contains("FS") ? Color.orange : (course.term.contains("SS") ? Color.green : Color.blue)
                                )
                            )
                    
                    Text("\(course.subject) \(course.code)")
                        .font(.subheadline)
                        .padding(8)
                        .background(Capsule().stroke())
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        
                        Text("\(course.instructor)")
                            .font(.headline)
                        
                        Text("\(course.title)")
                            .multilineTextAlignment(.trailing)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                        
                    }
                    
                }
            }
            .padding()
        }
    }
}

struct CoursesRow_Previews: PreviewProvider {
    static var previews: some View {
        CoursesRow(course: Course(term: "SS20", subject: "CSE", code: 325, title: "Computer Systems", instructor: "MCCULLEN,MARK H", total: 183, average: 2.546448087, four: 37, threefive: 17, three: 29, twofive: 32, two: 28, onefive: 17, one: 10, zero: 13, incomplete: 0, withdrawn: 0, passed: 0, nograde: 0))
    }
}
