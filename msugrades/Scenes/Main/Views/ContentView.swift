//
//  ContentView.swift
//  msugrades
//
//  Created by William Huynh on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    
    var body: some View {
        TabView() {
            CoursesView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                }
            ProfileView()
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
