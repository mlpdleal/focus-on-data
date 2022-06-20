//
//  AddBookView.swift
//  Bookworm
//
//  Created by Manoel Leal on 18/06/22.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var dateReview = Date.now
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.dateReview = dateReview
                        
                        try? moc.save()
                        dismiss()
                    }
                    .disabled(validate())
                }
                
            }
            .navigationTitle("Add Book")
    
        }
    }
    
    func validate() -> Bool {
        if title.trimmingCharacters(in: .whitespaces).isEmpty || author.trimmingCharacters(in: .whitespaces).isEmpty  || genre.trimmingCharacters(in: .whitespaces).isEmpty {
            return true
        }
        
        return false
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
