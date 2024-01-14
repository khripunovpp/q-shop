//
//  PaymentsView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import SwiftUI

struct PaymentsView: View {
    let paymentAccounts: [String] = [
        "Bank transfer",
        "Apple pay",
        "MBWay"
    ]
    @State var activePaymentAccountIdx: Int = 0 {
        didSet {
            activePaymentAccountStored = paymentAccounts[activePaymentAccountIdx]
            
            print("updated activePaymentAccount \(activePaymentAccountStored)")
        }
    }
    @State var paymentAccountOnEditIdx: Int = 0 {
        didSet {
            paymentAccountOnEdit = paymentAccounts[paymentAccountOnEditIdx]
        }
    }
    
    @AppStorage("activePaymentAccount") var activePaymentAccountStored: String = ""
    @State var displayEditing: Bool = false
    @State var paymentAccountOnEdit: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeaderView(title: "Payment accounts")
            
            ForEach(paymentAccounts.indices, id: \.self) { index in
                SingleSettingView(
                    paymentAccounts[index],
                    displayEditing: $displayEditing,
                    style: index == activePaymentAccountIdx ? ActiveStyles : InactiveStyles
                ) {newValue in
                    activePaymentAccountIdx = index
                    print("activate payment \(newValue)")
                } onEdit: { newValue in
                    paymentAccountOnEditIdx = index
                    print("new payment \(newValue)")
                } content: { paymentAccount in
                    VStack(spacing: 0) {
                        ScreenHeaderView(title: "Edit payment account")
                        Text(paymentAccountOnEdit)
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
