//
//  LoginScreenViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation

class LoginScreenViewModel: ObservableObject {
    @Published var email = ""
    @Published var passsword = ""
    @Published var errors = ""
    
    init(){}
    
    func login() {
    }
}
