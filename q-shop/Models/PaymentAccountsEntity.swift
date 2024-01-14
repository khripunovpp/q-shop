//
//  PaymentAccountsEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import Foundation

final class PaymentAccountsEntity {
    private var paymentAccounts: [String]
    
    init(_ paymentAccounts: [String]?) {
        self.paymentAccounts = paymentAccounts ?? []
    }
    
    func getOne(
        _ index: Int
    ) -> String {
        return paymentAccounts[index]
    }
    
    func add(
        _ value: String
    ) {
        paymentAccounts.append(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: String
    ) {
        paymentAccounts[index] = newValue
    }
    
    func delete(
        _ index: Int
    ) {
        paymentAccounts.remove(at: index)
    }
    
    var list: [String] {
        paymentAccounts
    }
}
