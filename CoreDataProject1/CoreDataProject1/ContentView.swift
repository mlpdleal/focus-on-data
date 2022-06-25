//
//  ContentView.swift
//  CoreDataProject1
//
//  Created by Manoel Leal on 22/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = ""
    
    
    var body: some View {
        VStack{
            
            TextField("Search", text: $lastNameFilter)
            
            FilteredList(sortDescriptors: [], filterKey: "lastName", filterValue: lastNameFilter, predicate: .contains) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples"){
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A"){
                lastNameFilter = "A"
            }
            
            Button("Show S"){
                lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self){
            ContentView()
                .preferredColorScheme($0)
        }
        
            
    }
}
