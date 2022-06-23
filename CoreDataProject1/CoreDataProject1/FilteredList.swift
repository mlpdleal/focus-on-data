//
//  FilteredList.swift
//  CoreDataProject1
//
//  Created by Manoel Leal on 22/06/22.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View> : View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self){ item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content){
        _fetchRequest = FetchRequest<T>(sortDescriptors: [],
                                             predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        
        self.content = content
    }
}

