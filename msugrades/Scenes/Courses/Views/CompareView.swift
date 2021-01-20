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
    @EnvironmentObject var compareCourses: CompareCourses
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    @State var removeAllTrue: Bool = true
    @State var tempSaveRemovedCourse = Set([Course]())
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Compare Course")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    compareCourses.courses.append(viewModel.course)
                }, label: {
                    Text("Save")
                })
                .isHidden(compareCourses.courses.contains(viewModel.course))
                
            }
            .padding()
            
            Divider()
            
            
            
            List {
                ForEach(compareCourses.courses, id: \.self) { course in
                    
                    CoursesRow(viewModel: CourseViewModel(course: course))
                    
                }.onDelete(perform: delete)
                
                Text("Features:\n\nSaving:\nStart saving a list of courses to compare by tapping the Save.\n\nDelete:\nSwipe left at a row to delete a course from your list.").foregroundColor(Color(.systemGray))
            }
            
            
        }
        .onDisappear(perform: {
            partialSheetManager.closePartialSheet()
        })
    }
    
    func delete(at offsets: IndexSet) {
        compareCourses.courses.remove(atOffsets: offsets)
    }
}

struct CompareView_Previews: PreviewProvider {
    
    static var previews: some View {
        CompareView(viewModel: CourseViewModel(course: Course(term: "SS20", subject: "CSE", code: 325, title: "Computer Systems", instructor: "MCCULLEN,MARK H", total: 183, average: 2.546448087, four: 37, threefive: 17, three: 29, twofive: 32, two: 28, onefive: 17, one: 10, zero: 13, incomplete: 0, withdrawn: 0, passed: 0, nograde: 0)))
    }
}
