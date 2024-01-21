//
//  CheckoutScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI
import Resolver

struct CheckoutScreenView: View {
    @InjectedObject var router: Router
    @InjectedObject var spinner: SpinnerProvider
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
                    ForEach($viewModel.items.indices, id: \.self) { index in
                        GoodRowView(
                            $viewModel.items[index] as! Good,
                            count: $viewModel.items[index].count,
                            changableMode: true
                        ) { newCount in
                            var c = viewModel.items[index]
                            c.count = newCount
                            viewModel.cartProvider.add(c)
                        } label: {
                            Text("\(viewModel.items[index].name) - $\(viewModel.items[index].formattedPrice)")
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
            
            ScreenHeaderView(title: "Total: $\(viewModel.totalFormatted)")
            
            BrandButtonView(
                label: "Pay",
                type: .big
            ) {
                spinner.visible = true
                viewModel.createOrder()
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                    router.navigate(to: .Order)
                    spinner.visible = false
                }
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
