//
//  CourseView.swift
//  msugrades
//
//  Created by William Huynh on 12/29/20.
//

import SwiftUI

struct CourseView: View {
    
    @ObservedObject var viewModel: CourseViewModel
    
    var body: some View {
        ZStack {
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    
                    
                    VStack(spacing: 8) {
                        
                        HStack {
                            Text("\(viewModel.course.subject) \(viewModel.course.code) - \(viewModel.course.title)")
                                .font(.title)
                                .bold()
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        
                        HStack {
                            Text("\(viewModel.getInstructors())")
                                .font(.headline)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        
                        
                    }
                    .padding(.vertical)
                    
                    
                    
                    // Bar Chart
                    Text("Grade Count")
                        .font(.headline)
                    
                    HStack(alignment: .bottom, spacing: 8) {
                        
                        Bar(gpa: viewModel.course.four, total: viewModel.course.total, color: .fourGreen, score: "4.0", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.threefive, total: viewModel.course.total, color: .threefiveGreen, score: "3.5", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.three, total: viewModel.course.total, color: .threeGreen, score: "3.0", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.twofive, total: viewModel.course.total, color: .twofiveYellow, score: "2.5", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.two, total: viewModel.course.total, color: .twoYellow, score: "2.0", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.onefive, total: viewModel.course.total, color: .onefiveOrange, score: "1.5", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.one, total: viewModel.course.total, color: .oneOrange, score: "1.0", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.zero, total: viewModel.course.total, color: .zeroRed, score: "0.0", height: 900, showCounts: true)
                        
                        Bar(gpa: viewModel.course.withdrawn, total: viewModel.course.total, color: .blue, score: "W", height: 900, showCounts: true)
                        Bar(gpa: viewModel.course.incomplete, total: viewModel.course.total, color: .purple, score: "I", height: 900, showCounts: true)
                        
                    }
                    .frame(height: 250)
                    
                    Text("Statistics")
                        .font(.headline)
                    
                    // Stats
                    ZStack {
                        Color(.systemGray6)
                        
                        HStack {
                            
                            ZStack {
                                Color(.white).opacity(0.0)
                                VStack {
                                    Text(String(format: "%.2f", viewModel.getMedian()))
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(viewModel.getColor(value: viewModel.getMedian()))
                                    Text("median")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                            }
                            
                            Divider()
                            
                            ZStack {
                                Color(.white).opacity(0.0)
                                VStack {
                                    Text(String(format: "%.2f", viewModel.course.average))
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(viewModel.getColor(value: viewModel.course.average))
                                    Text("average")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                            }
                            
                            Divider()
                            
                            ZStack {
                                Color(.white).opacity(0.0)
                                VStack {
                                    Text("\(viewModel.course.total)")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text("students")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                            }
                            
                        }
                        .frame(height: 75)
                        
                    }
                    .cornerRadius(10)
                    
                    
                    // Titles
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Term")
                                .font(.subheadline)
                            Spacer()
                            Text("\(viewModel.course.term)")
                                .foregroundColor(.secondary)
                        }
                        Divider()
                        HStack {
                            Text("Course")
                                .font(.subheadline)
                            Spacer()
                            Text("\(viewModel.course.subject) \(viewModel.course.code)")
                                .foregroundColor(.secondary)
                        }
                        Divider()
                        HStack {
                            Text("Title")
                                .font(.subheadline)
                            Spacer()
                            Text("\(viewModel.course.title)")
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Divider()
                        HStack(alignment: .top) {
                            Text("Instructor(s)")
                                .font(.subheadline)
                            Spacer()
                            Text("\(viewModel.getInstructors())")
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.trailing)
                        }
                        Divider()
                    }
                    .padding(.vertical)
                    
                }
                .padding()
            }
        }
        .navigationBarTitle("\(viewModel.getTerm())", displayMode: .inline)
    }
}

struct CourseView_Previews: PreviewProvider {
    
    static var previews: some View {
        CourseView(viewModel: CourseViewModel(course: Course(term: "SS20", subject: "CSE", code: 325, title: "Computer Systems", instructor: "MCCULLEN,MARK H", total: 183, average: 2.546448087, four: 37, threefive: 17, three: 29, twofive: 32, two: 28, onefive: 17, one: 10, zero: 13, incomplete: 0, withdrawn: 0, passed: 0, nograde: 0)))
        
    }
}
