//
//  SearchBarView.swift
//  msugrades
//
//  Created by William Huynh on 12/29/20.
//

import SwiftUI
import UIKit

struct SearchBarView: View {
    
    @ObservedObject var viewModel: CoursesViewModel
    
    var placeholder: String
    @Binding var error: Bool
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack{
            HStack{
                TextField(placeholder, text: $searchText, onCommit: {
                    isSearching = false
                    viewModel.loadData(course: searchText) { (res) in
                        error = !res
                        print(error)
                    }
                    UIApplication.shared.endEditing()
                })
                .disableAutocorrection(true)
                .padding(.leading, 16)
            }
            .padding()
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: {
                            searchText = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                        
                        Button(action: {
                            isSearching.toggle()
                            UIApplication.shared.endEditing()
                        }, label: {
                            Text("Cancel")
                                .fontWeight(.light)
                        })
                    }
                    
                }.padding(.horizontal)
                .foregroundColor(.gray)
                
            ).transition(.move(edge: .trailing))
            
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(viewModel: CoursesViewModel(), placeholder: "Search by Course Code", error: .constant(true), searchText: .constant(""), isSearching: .constant(true))
    }
}
