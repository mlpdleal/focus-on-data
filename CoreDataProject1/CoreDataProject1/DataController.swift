//
//  DataController.swift
//  CoreDataProject1
//
//  Created by Manoel Leal on 22/06/22.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data failed \(error.localizedDescription)")
            }
            
        }
    }
}
