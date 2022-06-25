//
//  DataController.swift
//  CoreDataExample
//
//  Created by Manoel Leal on 23/06/22.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "CoreDataExample")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data Failed \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
    
}
