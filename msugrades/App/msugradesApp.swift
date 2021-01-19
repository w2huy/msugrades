//
//  msugradesApp.swift
//  msugrades
//
//  Created by William Huynh on 12/28/20.
//

import SwiftUI
import PartialSheet

@main
struct msugradesApp: App {
    
    let persistenceController = PersistenceController.shared
    let sheetManager: PartialSheetManager = PartialSheetManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
