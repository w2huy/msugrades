//
//  CoursesViewModel.swift
//  msugrades
//
//  Created by William Huynh on 12/28/20.
//

import Foundation

class CoursesViewModel: ObservableObject {
    
    // @Published var messages = "Messages inside obserable object"
    
    @Published var courses = [Course]()
    
    func loadData(course: String) {
        
        let endingUrl = formatNicely(course: course)
        
        let apiurl = "https://www.msugradesapi.com/grades/\(endingUrl)"
        
        guard let url = URL(string: apiurl) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Courses.self, from: data) {
                    DispatchQueue.main.async {
                        self.courses = decodedResponse.courses
                        print(self.courses.count)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
    }
    
    func formatNicely(course: String) -> String {
        
        var str = course.trimmingCharacters(in: .whitespacesAndNewlines)
        str = str.replacingOccurrences(of: " ", with: "_")
        
        return str
    }
}


