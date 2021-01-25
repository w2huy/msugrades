//
//  CompareView.swift
//  msugrades
//
//  Created by William Huynh on 1/19/21.
//

import SwiftUI
import PartialSheet

struct CompareView: View {
    
    @State var viewModel: CourseViewModel
    @EnvironmentObject var compareCoursesVM: CompareCoursesViewModel
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    @State var removeAllTrue: Bool = true
    @State var tempSaveRemovedCourse = Set([Course]())
    
    var body: some View {
        VStack {
            
            HStack(alignment: .bottom) {

                Text("Compare Courses")
                    .font(.title3)
                    .bold()

                Spacer()

                Button(action: {
                    compareCoursesVM.courses.append(viewModel.course)
                }, label: {
                    Text("Add")
                })
                .isHidden(compareCoursesVM.courses.contains(viewModel.course))

            }
            .padding()
            
            
            
            List {
                ForEach(compareCoursesVM.courses, id: \.self) { course in
                    
                    CoursesRow(viewModel: CourseViewModel(course: course))
                    
                }.onDelete(perform: delete)
                
                Text("Saving:\nStart saving a list of courses to compare by tapping on Save.\n\nDelete:\nSwipe left at a row to delete a course from your list.").foregroundColor(Color(.systemGray))
                    .padding()
            }
            .listStyle(PlainListStyle())
            
            
        }
        .onDisappear(perform: {
            partialSheetManager.closePartialSheet()
        })
    }
    
    func delete(at offsets: IndexSet) {
        compareCoursesVM.courses.remove(atOffsets: offsets)
    }
}

struct CompareView_Previews: PreviewProvider {
    
    static var previews: some View {
        CompareView(viewModel: CourseViewModel(course: Course(term: "SS20", subject: "CSE", code: 325, title: "Computer Systems", instructor: "MCCULLEN,MARK H", total: 183, average: 2.546448087, four: 37, threefive: 17, three: 29, twofive: 32, two: 28, onefive: 17, one: 10, zero: 13, incomplete: 0, withdrawn: 0, passed: 0, nograde: 0)))
    }
}
