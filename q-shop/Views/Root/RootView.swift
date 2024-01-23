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
    @InjectedObject var tabRouter: TabRouter
    @InjectedObject var spinner: SpinnerProvider
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            NavigationStack(path: $router.navPath) {
                if userProvider.hasSignedIn {
                    VStack(spacing: 0){
                        authroziedView()
                    }
                } else {
                    LoginScreenView()
                }
            }
            
            Spinner(showSpinner: $spinner.visible)
        }
        
    }
    
    @ViewBuilder func authroziedView() -> some View{
        main().navigationDestination(for: RouteName.self) { destination in
                    switch destination {
                    case .Main:
                        main()
                    case .Register:
                        RegisterScreenView()
                    case .Login:
                        LoginScreenView().navigationBarBackButtonHidden()
                    }
                }
    }
    
    @ViewBuilder func main() -> some View {
        TabView(selection: $tabRouter.selectedTab) {
            ShowcaseScreenView().tag(TabScreen.home)
            CheckoutScreenView().tag(TabScreen.cart)
            ProfileScreenView().tag(TabScreen.profile)
        }
        tabBar()
    }
    
    @ViewBuilder func tabBar() -> some View {
        
        GeometryReader { proxy in
            let width = proxy.size.width
            HStack(spacing: 0) {
                ForEach(TabScreen.allCases, id: \.self){ tab in
                    Button {
                        withAnimation(.easeOut(duration: 0.2)){
                            print("tab selected \(tab)")
                            tabRouter.selectedTab = tab
                        }
                    } label: {
//                        Image(systemName: "")
//                            .renderingMode(.template)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 25,height: 25)
//                            .frame(maxWidth: .infinity)
//                            .foregroundColor(selectedTab == tab ? .green : .gray)
//                            .scaleEffect(selectedTab == tab ? 1.5 : 1)
                        
                        Text(tab.rawValue)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 30)
        .padding(.bottom,10)
        .padding([.horizontal,.top])
    }
}

#Preview {
    RootView().authroziedView()
}
