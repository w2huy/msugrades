//
//  CoursesRow.swift
//  msugrades
//
//  Created by William Huynh on 12/29/20.
//

import SwiftUI

struct CoursesRow: View {
    
    var viewModel: CourseViewModel
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Instructor(s):")
                            .font(.subheadline)
                        Text("\(viewModel.getInstructors())")
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                    Text("\(viewModel.getTerm())")
                        .font(.subheadline)
                        .foregroundColor(viewModel.getTermColor())
                        .padding(8)
                        .background(
                            Capsule()
                                .stroke(viewModel.getTermColor())
                        )
                    
                }
                HStack {
                    HStack(alignment: .bottom, spacing: 8) {
                        Bar(gpa: viewModel.course.four, total: viewModel.course.total, color: .fourGreen, score: "4.0", height: 100, showCounts: true)
                        Bar(gpa: viewModel.course.threefive, total: viewModel.course.total, color: .threefiveGreen, score: "3.5", height: 100, showCounts: true)
                        Bar(gpa: viewModel.course.three, total: viewModel.course.total, color: .threeGreen, score: "3.0", height: 100, showCounts: true)
                        Bar(gpa: viewModel.course.twofive, total: viewModel.course.total, color: .twofiveYellow, score: "2.5", height: 100, showCounts: true)
                        Bar(gpa: viewModel.course.two, total: viewModel.course.total, color: .twoYellow, score: "2.0", height: 100, showCounts: true)
                        Bar(gpa: viewModel.course.onefive, total: viewModel.course.total, color: .onefiveOrange, score: "1.5", height: 100, showCounts: true)
                        Bar(gpa: viewModel.course.one, total: viewModel.course.total, color: .oneOrange, score: "1.0", height: 100, showCounts: true)
                        Bar(gpa: viewModel.course.zero, total: viewModel.course.total, color: .zeroRed, score: "0.0", height: 100, showCounts: true)
                    }
                    .frame(height: 100)
                    .padding(.trailing)
                    
                    VStack(alignment: .trailing) {
                        
                        HStack {
                            Text("med:")
                                .font(.subheadline)
                            Text(String(format: "%.2f",viewModel.getMedian()))
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                        
                        HStack {
                            Text("avg:")
                                .font(.subheadline)
                            Text(String(format: "%.2f",viewModel.course.average))
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                        
                        HStack {
                            Text("total:")
                                .font(.subheadline)
                            Text("\(viewModel.course.total)")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                        
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct CoursesRow_Previews: PreviewProvider {
    static var previews: some View {
        CoursesRow(viewModel: CourseViewModel(course: Course(term: "SS20", subject: "CSE", code: 325, title: "Computer Systems", instructor: "MCCULLEN,MARK H", total: 183, average: 2.546448087, four: 37, threefive: 17, three: 29, twofive: 32, two: 28, onefive: 17, one: 10, zero: 13, incomplete: 0, withdrawn: 0, passed: 0, nograde: 0)))
    }
}
