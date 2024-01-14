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
        VStack(spacing: 0) {
            SearchBarView()
            FiltersBarView()
            
            GoodsListView(
                items: $viewModel.showcaseItems
            ) { name, newQuantity in
                viewModel.cartProvider.add(name, newQuantity)
            }
            
            if viewModel.count > 0 {
                NavigationLink(isActive: $goToCart) {
                    CartScreenView()
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    BrandButtonView(
                        label: "Show \(viewModel.count) items in your cart"
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
