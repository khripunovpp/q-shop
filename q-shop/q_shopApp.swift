//
//  q_shopApp.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI
import FirebaseCore
import Resolver

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        Resolver.register { AuthService() as AuthService }.scope(.application)
        Resolver.register { CartProvider() as CartProvider }.scope(.application)
        Resolver.register { ShowcaseProvider() as ShowcaseProvider }.scope(.application)
        Resolver.register { AddressesProvider() as AddressesProvider }.scope(.application)
        Resolver.register { PaymentAccountsProvider() as PaymentAccountsProvider }.scope(.application)
        
        return true
    }
}

@main
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RootView()
            }
        }
    }
}
