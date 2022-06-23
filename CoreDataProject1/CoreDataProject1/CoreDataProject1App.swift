//
//  CoreDataProject1App.swift
//  CoreDataProject1
//
//  Created by Manoel Leal on 22/06/22.
//

import SwiftUI

@main
struct CoreDataProject1App: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
