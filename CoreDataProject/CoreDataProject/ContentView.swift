//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Manoel Leal on 21/06/22.
//

import SwiftUI



struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movie>
    
    var body: some View {
        VStack{
            List(movies, id: \.self) { movie in
                Text(movie.title ?? "Unknown")
            }
            
            Button("Add"){
                let movie = Movie(context: moc)
                movie.title = "Harry Potter"
                movie.director = "J.K.Rolling"
                movie.year = Int16(2000)
                
            }
            
            Button("Save"){
                do{
                    try moc.save()
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
