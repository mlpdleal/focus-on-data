//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by Manoel Leal on 23/06/22.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
