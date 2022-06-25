//
//  Candy+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Manoel Leal on 23/06/22.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }

}

extension Candy : Identifiable {

}
