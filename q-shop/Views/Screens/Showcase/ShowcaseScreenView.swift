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
    @StateObject var viewModel = ShowcaseScreenViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView()
            FiltersBarView()
            GoodsListView(items: viewModel.showcaseItems) { added,count in
                viewModel.cartProvider.add(added, count)
            }
            if viewModel.cartItems.count > 0 {
                NavigationLink(isActive: $goToCart) {
                    CartScreenView()
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    BrandButtonView(
                        label: "Checkout \(viewModel.cartItems.count)"
                    ) {
                        goToCart = true
                    }
                }
            }
        }.onAppear{
            viewModel.showcaseProvider.manualEmit()
        }
    }
}

#Preview {
    ShowcaseScreenView()
}
