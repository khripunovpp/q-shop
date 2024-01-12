//
//  RootView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI
import Resolver

struct RootView: View {
    @Injected var authService: AuthService
    
    var body: some View {
        if authService.isSignnedIn {
            CheckoutScreenView()
        } else {
            LoginScreenView()
        }
    }
}

#Preview {
    RootView()
}
