//
//  ShowcaseScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI
import Resolver


struct ShowcaseScreenView: View {
    @State var goToCart = false
    @Bindable var viewModel = ShowcaseScreenViewModel()
    
    var body: some View {
        Group {
            ZStack {
                LinearGradient(
                    colors: [Color.hex("#eeeeee"), .white],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).ignoresSafeArea()
                
                VStack(spacing: 0) {
                    SearchBarView().padding(EdgeInsets(top: 0, leading: BASE_PADDING, bottom: 0, trailing: BASE_PADDING))
                    
                    Group {
                        FiltersBarView()
                            .padding(EdgeInsets(
                                top: 3,
                                leading: BASE_PADDING - 8,
                                bottom: 3,
                                trailing: BASE_PADDING - 8
                            ))
                        
                        GoodsListView(
                            items: $viewModel.showcaseItems
                        ) { item in
                            viewModel.cartProvider.add(item)
                        }
                    }
                    
                    if viewModel.count > 0 {
                        NavigationLink(isActive: $goToCart) {
                            CheckoutScreenView()
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            VStack {
                                BrandButtonView(
                                    label: "Show \(viewModel.count) items in your cart"
                                ) {
                                    goToCart = true
                                }
                                .padding(BASE_PADDING)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ShowcaseScreenView()
}
