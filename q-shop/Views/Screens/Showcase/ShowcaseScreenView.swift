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
            
            ScrollView {
                ForEach(viewModel.showcaseItems.indices, id: \.self) { index in
                    GoodItemView(
                        count: $viewModel.showcaseItems[index].count,
                        content: viewModel.showcaseItems[index].name
                    ) { newQuantity in
                        viewModel.cartProvider.add(viewModel.showcaseItems[index].name, newQuantity)
                        
                        
                    }
                }
            }
            
            if viewModel.count > 0 {
                NavigationLink(isActive: $goToCart) {
                    CartScreenView()
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    BrandButtonView(
                        label: "Checkout \(viewModel.count)"
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
