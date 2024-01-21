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
    @InjectedObject var router: Router
    @InjectedObject var spinner: SpinnerProvider
    @State var path = NavigationPath()
    
    var body: some View {
        ZStack {
            NavigationStack(path: $router.navPath) {
                if userProvider.hasSignedIn {
                    ProfileScreenView().navigationDestination(for: RouteName.self) { destination in
                        switch destination {
                        case .Profile:
                            Text("Profile")
                        case .Showcase:
                            ShowcaseScreenView().navigationBarBackButtonHidden()
                        case .Checkout:
                            CheckoutScreenView()
                        case .Orders:
                            ShowcaseScreenView().navigationBarBackButtonHidden()
                        case .Order:
                            OrderScreenView().navigationBarBackButtonHidden()
                        case .Register:
                            RegisterScreenView()
                        case .Login:
                            LoginScreenView().navigationBarBackButtonHidden()
                        }
                    }
                } else {
                    LoginScreenView()
                }
                
            }
            
            Spinner(showSpinner: $spinner.visible)
        }
       
    }
}

#Preview {
    RootView()
}
