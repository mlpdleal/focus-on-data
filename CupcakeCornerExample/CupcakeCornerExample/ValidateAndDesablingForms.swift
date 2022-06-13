//
//  ValidateAndDesablingForms.swift
//  CupcakeCornerExample
//
//  Created by Manoel Leal on 13/06/22.
//

import SwiftUI

struct ValidateAndDesablingForms: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form{
            Section{
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section{
                Button("Create account"){
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct ValidateAndDesablingForms_Previews: PreviewProvider {
    static var previews: some View {
        ValidateAndDesablingForms()
    }
}
