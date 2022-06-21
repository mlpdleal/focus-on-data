//
//  HashableExempleView.swift
//  CoreDataProject
//
//  Created by Manoel Leal on 21/06/22.
//

import SwiftUI

struct Student: Hashable{
    let name: String
}

struct HashableExempleView: View {
    
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Gringer")]
    
    var body: some View {
        List{
            ForEach(students, id: \.self){
                Text($0.name)
            }
        }
    }
}

struct HashableExempleView_Previews: PreviewProvider {
    static var previews: some View {
        HashableExempleView()
    }
}
