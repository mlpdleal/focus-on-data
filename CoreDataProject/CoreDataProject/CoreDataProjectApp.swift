//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Manoel Leal on 21/06/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataControler = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataControler.container.viewContext)
        }
    }
}
