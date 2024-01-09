//
//  RegisterScreenViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Resolver
import Foundation

class RegisterScreenViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var passsword = ""
    @Published var errors = ""
    
    @Injected var authService: AuthService
    
    init(){}
    
    func signup() {
        print("signup start")
        guard validate() else {
            print("invalid")
            return
        }
        
        authService.createUser(name: name, email: email, password: passsword) { result, error in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
            guard let userId = result?.user.uid else {
                return
            }
            
        }
    }
    
    private func validate()->Bool {
        guard !email.trimmingCharacters(in:.whitespaces).isEmpty else {
            errors = "Email is empty"
            return false
        }
        
        guard name.rangeOfCharacter(from: CharacterSet.letters.union(.whitespaces).inverted) == nil else {
            errors = "Name can contains only letters"
            return false
        }
        
        guard passsword.count >= 3 else {
            errors = "Password is to short. Use paswword at least 3 charachters"
            return false
        }
        
        errors = ""
        
        return true
    }
}
