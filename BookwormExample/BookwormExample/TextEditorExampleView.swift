//
//  TextEditorExampleView.swift
//  BookwormExample
//
//  Created by Manoel Leal on 17/06/22.
//

import SwiftUI

struct TextEditorExampleView: View {
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView{
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TextEditorExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorExampleView()
    }
}
