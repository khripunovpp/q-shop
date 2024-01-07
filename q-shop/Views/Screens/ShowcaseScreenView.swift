//
//  ShowcaseScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI
import Resolver

struct ShowcaseScreenView: View {
    @State var sheet = false
    @State var goToCart = false
    @StateObject var viewModel = ShowcaseScreenViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView()
            FiltersBar()
            GoodsList() { added,count in
                viewModel.add(added, count)
            }
            if viewModel.items.count > 0 {
                NavigationLink(isActive: $goToCart) {
                    CartScreenView()
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    BrandButton(
                        label: "Checkout \(viewModel.items.count)"
                    ) {
                        goToCart = true
                    }
                }
            }
        }.sheet(isPresented: $sheet) {
            VStack(spacing: 0){
                Spacer()
                SingleGoodDetailsScreenView().presentationDetents([.fraction(0.3)])
            }
        }
    }
}

#Preview {
    ShowcaseScreenView()
}
