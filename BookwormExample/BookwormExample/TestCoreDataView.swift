//
//  TestCoreDataView.swift
//  BookwormExample
//
//  Created by Manoel Leal on 17/06/22.
//

import SwiftUI

struct TestCoreDataView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack{
            List(students){ student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add"){
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Gringer", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct TestCoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        TestCoreDataView()
    }
}
