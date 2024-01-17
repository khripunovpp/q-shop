//
//  RootView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI
import Resolver

struct RootView: View {
    @Injected var userProvider: UserProvider
    
    var body: some View {
        if userProvider.hasSignedIn {
            ShowcaseScreenView()
        } else {
            LoginScreenView()
        }
    }
}

#Preview {
    RootView()
}
