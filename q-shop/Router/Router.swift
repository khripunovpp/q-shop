//
//  Router.swift
//  q-shop
//
//  Created by Khripunov Pavel on 19/01/2024.
//

import SwiftUI

enum RouteName: CaseIterable, Codable, Hashable  {
    case Showcase, Checkout, Profile, Orders, Order, Register, Login
}

final class Router: ObservableObject {
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: RouteName) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
