//
//  DataController.swift
//  Bookworm
//
//  Created by Manoel Leal on 18/06/22.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed \(error.localizedDescription)")
            }
        }
    }
}
