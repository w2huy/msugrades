//
//  ContentView.swift
//  msugrades
//
//  Created by William Huynh on 12/28/20.
//

import SwiftUI
import UIKit

struct CoursesView: View {
    
    @ObservedObject var viewModel = CoursesViewModel()
    
    @State var error: Bool = false
    @State var searchText: String = ""
    @State var titleText: String = "MSU Grades"
    @State var isSearching: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                VStack(spacing: 0) {
                    
                    Divider()
                    
                    // Search Bar Subject
                    SearchBarView(viewModel: viewModel, placeholder:"Search by Course Code", error: $error, searchText: $searchText, isSearching: $isSearching)
                    
                    Divider()
                    
                    if viewModel.courses.count != 0 {
                        
                        VStack(spacing: 8) {
                            
                            HStack {
                                Text("\(viewModel.courses[0].subject) \(viewModel.courses[0].code) - \(viewModel.courses[0].title)")
                                    .font(.headline)
                                Spacer()
                            }
                            
                            HStack {
                                Text("\(viewModel.courses.count) matches")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                        .padding()
                        
                        Divider()
                    }
                    
                    
                    List {
                        if viewModel.courses.count != 0 {
                            
                            // List
                            ForEach(self.viewModel.courses, id: \.self) { course in
                                
                                NavigationLink(
                                    destination: CourseView(viewModel: CourseViewModel(course: course)),
                                    label: {
                                        
                                        // Row
                                        CoursesRow(viewModel: CourseViewModel(course: course))
                                        
                                    })
                                
                            }
                        }
                        else {
                            VStack(alignment: .leading, spacing: 16) {
                                
                                Text("MSU Grades shows you the grades that past students received at Michigan State University.")
                                    .bold()
                                
                                Text("The grade data shown on this website is obtained via FOIA requests to Michigan State University. This means our data is authoritative, while websites like Koofers and Rate My Professors show grades which are self-reported by their users.")
                                
                                Text("Getting Started")
                                    .bold()
                                
                                Text("We break down grade reports by course and instructor. Get started by searching for one above!")
                                
                                Text("Grade Availability")
                                    .bold()
                                
                                Text("It typically takes 2-4 weeks after a semester ends before we obtain its grade data. When we get grades for a new semester, we'll post a banner at the top of this page for at least a week.")
                                
                                Text("For legal compliance reasons, MSU only provides us with grade data for course sections which meet certain criteria. This includes course sections which had 10 or less students, or were taught by a student instructor.")
                            }
                            .padding()
                        }
                        
                    }
                    .listStyle(InsetListStyle())
                }
                .navigationBarTitle("MSU Grades", displayMode: .inline)
                .navigationBarHidden(true)
                .alert(isPresented: $error, content: {
                    Alert(title: Text("Course not found"), message: Text("Search currently only supports non-pass/fail courses. \nMake sure to enter course codes in the correct format. \n ex: CSE 331"), dismissButton: .default(Text("OK")))
                })
            }
        }
    }
    
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
        CoursesView()
            .colorScheme(.dark)
    }
}
