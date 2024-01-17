//
//  UserProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//
import RxSwift
import Resolver

class UserProvider {
    private var currentUser: Observable<UserEntity?>
    private var authService: AuthService
    
    init() {
        authService = Resolver.resolve()
        self.currentUser = authService.currentUser$.asObservable().map { user in
            return user == nil ? nil : UserEntity(id: user?.uid ?? "", name: user?.displayName ?? "")
        }.share(replay: 1)
    }
    
    var hasSignedIn: Bool {
        authService.isSignnedIn
    }
}
