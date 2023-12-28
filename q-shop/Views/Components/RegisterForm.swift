//
//  RegisterForm.swift
//  my-todo-list
//
//  Created by Khripunov Pavel on 17/12/2023.
//

import SwiftUI

struct RegisterForm: View {
    
    @StateObject var registerViewModel = RegisterScreenViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            Form { 
                TextField("Name", text: $registerViewModel.name)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                TextField("Email", text: $registerViewModel.email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: $registerViewModel.passsword)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                if !registerViewModel.errors.isEmpty {
                    Text(registerViewModel.errors)
                }
            }
            
            BrandButton(
                label: "Create account",
                type:.big
            ) {
                registerViewModel.signup()
            }.padding(25)
            
        }
    }
}

#Preview {
    RegisterForm()
}
