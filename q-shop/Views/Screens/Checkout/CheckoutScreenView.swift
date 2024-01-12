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
    let addresses = [
        "Rua. do Barao de Sao Cosme, 250, ap. 0.1, floor -1",
        "Morskaya embankment 15, appartment 25",
        "Microdistrict 1, build. 9, appartment 12"
    ]
    private var activeAdress = 0 {
        didSet {
            address = addresses[activeAdress] 
        }
    }
    @AppStorage("address") var address: String = ""
    let paymentAccounts = [
        "Bank transfer",
        "Apple pay",
        "MBWay"
    ]
    private var activePaymentAccountIdx = 0 {
        didSet {
            activePaymentAccount = paymentAccounts[activePaymentAccountIdx]
        }
    }
    @AppStorage("activePaymentAccount") var activePaymentAccount: String = ""
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            ScreenHeaderView(title: "Total")
            
            ScrollView{
                VStack{
                    ForEach(viewModel.items.indices, id: \.self) { index in
                        GoodRowView(
                            viewModel.items[index].name,
                            count: $viewModel.items[index].count
                        ) { newCount in
                            viewModel.cartProvider.add(
                                viewModel.items[index].name,
                                newCount
                            )
                        }
                    }
                }
                
                VStack {
                    SettingsRowView(
                        "Address",
                        displaySettings: $choiseAddress,
                        value: "Home"
                    ) { _ in
                        choiseAddress = true
                    } content: {
                        VStack(spacing: 0) {
                            ScreenHeaderView(title: "Adresses")
                            ForEach(addresses, id: \.self) { address in
                                SingleSettingView(
                                    address,
                                    displayEditing: .constant(false)
                                ) {newValue in
                                    
                                } content: {
                                    VStack(spacing: 0) {
                                        ScreenHeaderView(title: "Place fore editing")
                                        Spacer()
                                    }.padding(BASE_PADDING)
                                }
                            }
                            Spacer()
                        }.padding(BASE_PADDING)
                    }
                    
                    SettingsRowView(
                        "Payment",
                        displaySettings: $choisePayment,
                        value: "ApplePay"
                    ) { _ in
                        choisePayment = true
                    } content: {
                        VStack(spacing: 0) {
                            ScreenHeaderView(title: "Payment accounts")
                            ForEach(paymentAccounts, id: \.self) { acc in
                                SingleSettingView(
                                    acc,
                                    displayEditing: .constant(false)
                                ) {newValue in
                                    
                                } content: {
                                    VStack(spacing: 0) {
                                        ScreenHeaderView(title: "Place fore editing")
                                        Spacer()
                                    }.padding(BASE_PADDING)
                                }
                            }
                            Spacer()
                        }.padding(BASE_PADDING)
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
