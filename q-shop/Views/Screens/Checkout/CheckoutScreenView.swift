//
//  CheckoutScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct CheckoutScreenView: View {
    @StateObject var viewModel = CheckoutScreenViewModel()
    @State var choiseAddress = false
    @State var choisePayment = false
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            ScreenHeaderView(title: "Your order")
            
            ScrollView{
                VStack{
                    ForEach(viewModel.items.indices, id: \.self) { index in
                        GoodRowView(
                            viewModel.items[index].name,
                            count: $viewModel.items[index].count,
                            price: viewModel.items[index].price
                        ) { newCount in
                            var c = viewModel.items[index]
                            c.count = newCount
                            viewModel.cartProvider.add(c)
                        } content: {
                            
                        }
                    }
                }
                
                VStack {
                    SettingsRowView(
                        "Address",
                        displaySettings: $choiseAddress,
                        value: viewModel.activeAddress
                    ) { _ in
                        choiseAddress = true
                    } content: {
                        AddressesView()
                    }
                    
                    SettingsRowView(
                        "Payment",
                        displaySettings: $choisePayment,
                        value: viewModel.activePaymentAccount
                    ) { _ in
                        choisePayment = true
                    } content: {
                        PaymentsView()
                    }
                }
            }
            
            BrandButtonView(
                label: "Pay",
                type: .big
            ) {
            }
            Spacer()
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
    CheckoutScreenView()
}
