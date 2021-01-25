//
//  YourCoursesView.swift
//  msugrades
//
//  Created by William Huynh on 1/22/21.
//

import SwiftUI

struct YourCoursesView: View {
    
    @EnvironmentObject var yourCoursesVM: YourCoursesViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    ForEach(yourCoursesVM.courses, id: \.self) { course in
                        NavigationLink(
                            destination: CourseView(viewModel: CourseViewModel(course: course)),
                            label: {
                                CoursesRow(viewModel: CourseViewModel(course: course))
                            })
                    }
                    .onDelete(perform: delete)
                    
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationBarTitle("Compare Courses")
        }
    }
    
    func delete(at offsets: IndexSet) {
        yourCoursesVM.courses.remove(atOffsets: offsets)
    }
}

struct YourCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        YourCoursesView()
            .environmentObject(YourCoursesViewModel())
    }
}
