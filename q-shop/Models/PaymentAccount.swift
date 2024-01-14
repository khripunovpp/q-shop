//
//  PaymentAccount.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import Foundation

struct PaymentAccount: Hashable, Identifiable {
    let id = UUID().uuidString
    var label: String?
    var paymentMethod: PaymentMethod?
    var accountValue: String?
}
