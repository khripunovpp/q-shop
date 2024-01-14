//
//  PaymentsView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import SwiftUI

struct PaymentsView: View {
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

#Preview {
    PaymentsView()
}
