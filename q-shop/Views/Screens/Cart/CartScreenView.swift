//
//  CartScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct CartScreenView: View {
    @StateObject var viewModel = CartScreenViewModel()
    @State var checkout = false
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text("Your order")
                .textStyle(TitleLvl1)
                .padding(.bottom, BASE_PADDING)
            
            ForEach(viewModel.items.indices, id: \.self) { index in
                HStack {
                    Text("\(viewModel.items[index].name)")
                        .textStyle(RegularTextSyles)
                    Spacer()
                    QuantityButtonView(
                        count: $viewModel.items[index].count
                    ) { newCount in
                        viewModel.cartProvider.add(viewModel.items[index].name, newCount)
                    }
                        .frame(width: 100)
                }
                .padding(.bottom, BASE_PADDING)
            }
            
            Spacer()
            
            NavigationLink(isActive: $checkout) {
                CheckoutScreenView()
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                BrandButtonView(
                    label: "Checkout",
                    type: .big
                ) {
                    checkout = true
                }
            }
        }.padding(EdgeInsets(
            top: VIEWPORT_PADDING_V,
            leading: VIEWPORT_PADDING_H,
            bottom: VIEWPORT_PADDING_V,
            trailing: VIEWPORT_PADDING_H
        ))
        .onAppear(){
            viewModel.loadCart()
        }
    }
}

#Preview {
    CartScreenView()
}
