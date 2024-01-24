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
        main(withTab: TabScreen.home)
            .navigationDestination(for: RouteName.self) { destination in
                switch destination {
                case .Main:
                    main(withTab: TabScreen.home)
                case .Order:
                    OrderScreenView().navigationBarBackButtonHidden()
                case .Register:
                    RegisterScreenView()
                case .Login:
                    LoginScreenView().navigationBarBackButtonHidden()
                case .Profile:
                    main(withTab: TabScreen.profile)
                }
            }
    }
    
    @ViewBuilder func main(
        withTab: TabScreen
    ) -> some View {
        VStack(spacing: 0) {
            TabView(selection: $tabRouter.selectedTab) {
                ShowcaseScreenView().tag(TabScreen.home)
                CheckoutScreenView().tag(TabScreen.cart)
                ProfileScreenView().tag(TabScreen.profile)
            }
            tabBar()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            tabRouter.selectedTab = withTab
        }
    }
    
    @ViewBuilder func tabBar() -> some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(TabScreen.allCases, id: \.self){ tab in
                Button {
                    withAnimation(.easeOut(duration: 0.2)) {
                        print("tab selected \(tab)")
                        tabRouter.selectedTab = tab
                    }
                } label: {
                    Spacer()
                    Text(tab.title).foregroundColor(tabRouter.selectedTab == tab ? BrandColors.main : .gray)
                        .scaleEffect(tabRouter.selectedTab == tab ? 1.1 : 1)
                    Spacer()
                }.buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 30)
        .padding(.top, BASE_PADDING)
        .background(.regularMaterial)
    }
}

#Preview {
    RootView().authroziedView()
}
