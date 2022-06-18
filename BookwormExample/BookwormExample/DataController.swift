//
//  DataController.swift
//  BookwormExample
//
//  Created by Manoel Leal on 17/06/22.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
