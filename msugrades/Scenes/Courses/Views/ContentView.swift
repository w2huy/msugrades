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
    
    @State var courseCount: Int = 30
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                // Search Bar Subject
                SearchBarView(viewModel: viewModel, placeholder:"ex: CSE 325", searchText: $searchText, isSearching: $isSearching)
                
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
        .onAppear(perform: {
            viewModel.loadData(course: "CSE 325")
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .colorScheme(.dark)
    }
}
