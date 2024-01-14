//
//  PaymentAccountsEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import Foundation

final class PaymentAccountsEntity {
    private var paymentAccounts: [PaymentAccount]
    
    init(_ paymentAccounts: [PaymentAccount]?) {
        self.paymentAccounts = paymentAccounts ?? []
    }
    
    func getOne(
        _ index: Int
    ) -> PaymentAccount {
        return paymentAccounts[index]
    }
    
    func add(
        _ value: PaymentAccount
    ) {
        paymentAccounts.append(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: PaymentAccount
    ) {
        paymentAccounts[index] = newValue
    }
    
    func delete(
        _ index: Int
    ) {
        paymentAccounts.remove(at: index)
    }
    
    var list: [PaymentAccount] {
        paymentAccounts
    }
}
