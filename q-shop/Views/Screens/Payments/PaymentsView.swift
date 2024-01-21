//
//  PaymentsView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import SwiftUI

struct PaymentsView: View {
    @StateObject var viewModel = PaymentsViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeaderView(title: "Payment accounts")
            
            ForEach(viewModel.paymentAccounts.indices, id: \.self) { index in
                SingleSettingView(
                    viewModel.paymentAccounts[index].label == nil ? "Loading" : "\(viewModel.paymentAccounts[index].label!)",
                    displayEditing: $viewModel.displayEditing,
                    style: index == viewModel.activePaymentAccountIndex ? ActiveStyles : InactiveStyles
                ) { newAddress in
                    viewModel.paymentAccountOnEditIdx = index
                } onActivate: { newAddress in
                    viewModel.setActive(index)
                } content: { newAddress in
                    VStack(spacing: 0) {
                        ScreenHeaderView(title: "Edit address")
                        Text(viewModel.paymentAccountOnEdit?.label ?? "")
                        Spacer()
                    }.padding(BASE_PADDING)
                }
            }
            Spacer()
        }.padding(BASE_PADDING)
    }
}

#Preview {
    PaymentsView()
}
