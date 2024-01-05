//
//  UserProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

class UserProvider: UserProviderProtocol {

    var currentUser: UserEntity?
    
    private init(){}
    
    static let this = UserProvider()
}
