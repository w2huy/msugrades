//
//  ContentView.swift
//  msugrades
//
//  Created by William Huynh on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView() {
            CoursesView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                }
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.dark)
    }
}
