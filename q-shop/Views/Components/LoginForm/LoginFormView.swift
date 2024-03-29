//
//  LoginForm.swift
//  my-todo-list
//
//  Created by Khripunov Pavel on 17/12/2023.
//

import SwiftUI
import Resolver

struct LoginFormView: View {
    @State var email = ""
    @State var password = ""
    @Environment(\.colorScheme) var colorScheme
    @InjectedObject var router: Router
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            
            BrandButtonView(
                label: "Login",
                type:.big
            ) {
                router.navigate(to: .Register)
            }.padding(25)
            
            NavigationLink("Creaete account", destination: RegisterScreenView())
        }
    }
}

#Preview {
    LoginFormView()
}
