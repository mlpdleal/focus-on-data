//
//  BookwormExampleApp.swift
//  BookwormExample
//
//  Created by Manoel Leal on 17/06/22.
//

import SwiftUI

@main
struct BookwormExampleApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            TestCoreDataView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
