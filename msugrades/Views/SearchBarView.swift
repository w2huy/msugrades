//
//  SearchBarView.swift
//  msugrades
//
//  Created by William Huynh on 12/29/20.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var viewModel: CoursesViewModel
    
    var placeholder: String
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack{
            HStack{
                TextField(placeholder, text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(7.0)
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
                    }
                    
                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.easeInOut)
            
            if isSearching {
                Button(action: {
                    
                    isSearching = false
                    viewModel.loadData(course: searchText)
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Search")
                        .fontWeight(.bold)
                        .padding(.trailing)
                        .padding(.leading, -7)
                })
                .transition(.move(edge: .trailing))
                .animation(.easeInOut)
            }
            
        }
    }
}
