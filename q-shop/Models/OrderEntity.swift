//
//  OrderEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation

enum OrderState: CaseIterable {
    case initial, in_progress, finished, canceled
}

final class Order: Identifiable {
    let id: UUID
    let date: Date
    var state: OrderState = .initial
    let total: Float 
    let totalFormatted: String
    private var items: [any Good]
    private var cart: Cart
    private var payment: PaymentAccount
    private var address: Address
    var addressLabel: String {
        address.label
    }
    
    var paymentAccountLabel: String {
        payment.label ?? ""
    }
    
    var goodsCount: Int {
        items.reduce(0) { partialResult, item in
            print("item \(item)")
            return item.count
        }
    }
    
    init(
        _ cart: Cart,
        payedBy paymentAccount: PaymentAccount,
        to currentAddress: Address
    ) {
        id = UUID()
        date = Date()
        self.cart = cart
        total = self.cart.totalSum
        totalFormatted = formatPrice(self.cart.totalSum)
        items = self.cart.getItems()
        payment = paymentAccount
        address = currentAddress
    }
    
    func getITems() -> [any Good] {
        items
    }
    
    func addItem(
        _ item: any Good
    ) {
        items.append(item)
    }
}
