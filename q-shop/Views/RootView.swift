//
//  RootView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        if AuthService.shared.isSignnedIn {
            CartScreenView()
        } else {
            LoginScreenView()
        }
    }
}

#Preview {
    RootView()
}
