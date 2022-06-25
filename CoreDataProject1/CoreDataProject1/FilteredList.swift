//
//  FilteredList.swift
//  CoreDataProject1
//
//  Created by Manoel Leal on 22/06/22.
//

import CoreData
import SwiftUI

enum Predicate: String {
    case beginsWith = "BEGINSWITH",
         contains = "CONTAINS"
}

struct FilteredList<T: NSManagedObject, Content: View> : View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self){ item in
            self.content(item)
        }
    }
    
    init(sortDescriptors: [SortDescriptor<T>], filterKey: String, filterValue: String, predicate: Predicate, @ViewBuilder content: @escaping (T) -> Content){
        
        if filterValue.isEmpty {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors)
        } else {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors,
                                            predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        }
        self.content = content
    }
}


