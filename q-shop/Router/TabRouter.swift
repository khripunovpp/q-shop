//
//  TabRouter.swift
//  q-shop
//
//  Created by Khripunov Pavel on 23/01/2024.
//

import Foundation

enum TabScreen: String, CaseIterable, RawRepresentable {
    case home, cart, profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .cart:
            return "Cart"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home-icon"
        case .cart:
            return "cart-icon"
        case .profile:
            return "profile-icon"
        }
    }
}

final class TabRouter: ObservableObject {
    @Published var selectedTab = TabScreen.home
    
    func navigate(to destination: TabScreen) {
        selectedTab = destination
    }
}
