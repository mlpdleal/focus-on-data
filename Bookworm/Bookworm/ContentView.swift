//
//  ContentView.swift
//  Bookworm
//
//  Created by Manoel Leal on 18/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books){ book in
                    NavigationLink{
                        DetailView(book: book)
                    } label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.title)
                            
                            VStack(alignment: .leading){
                                if(book.rating == Int(1)){
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(.red)
                                    
                                    Text(book.author ?? "Unknown Tittle")
                                        .foregroundColor(.secondary)
                                        .bold()
                                    
                                } else {
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                    
                                    Text(book.author ?? "Unknown Tittle")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddBookView()
                }
        }
    }
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
