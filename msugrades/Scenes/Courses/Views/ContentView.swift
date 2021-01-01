//
//  ContentView.swift
//  msugrades
//
//  Created by William Huynh on 12/28/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = CoursesViewModel()
    
    @State var searchText: String = ""
    @State var isSearching: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                // Background
                Color.background
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    
                    // Search Bar Subject
                    SearchBarView(viewModel: viewModel, placeholder:"ex: CSE 325", searchText: $searchText, isSearching: $isSearching)
                    
                    // Count
                    if viewModel.courses.count != 0 {
                        HStack {
                            Text("\(viewModel.courses.count) matches")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            Spacer()
                        }
                        .padding()
                    }
                    
                    // List
                    ForEach(self.viewModel.courses, id: \.self) { course in
                        
                        NavigationLink(
                            destination: CourseView(course: course),
                            label: {
                                
                                // Row
                                CoursesRow(course: course)
                                
                            }).buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .background(Color(.systemGray4))
                            .padding(.leading)
                        
                    }
                    
                }
                .navigationTitle("MSU Grades")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .colorScheme(.dark)
    }
}
