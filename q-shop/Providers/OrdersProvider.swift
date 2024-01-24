//
//  OrdersManager.swift
//  q-shop
//
//  Created by Khripunov Pavel on 16/01/2024.
//

import Foundation
import RxSwift

final class OrdersProvider {
    private var itemsSubject = BehaviorSubject<[Order]>(value: [])
    private var currentSubject = ReplaySubject<Order>.create(bufferSize: 1)
    
    init() {
        
    }
    
    var current$: Observable<Order> {
        currentSubject.asObservable()
    }
    
    var items$: Observable<[Order]> {
        itemsSubject.asObservable()
    }
    
    func create(
        _ cart: Cart,
        withPayment pa: PaymentAccount,
        to address: Address
    ) -> Order {
        let current = Order(cart, payedBy: pa, to: address)
        currentSubject.onNext(current)
        var next = try! itemsSubject.value()
        next.append(current)
        itemsSubject.onNext(next)
        print("\n🥨 order created \(current)")
        
        return current
    }
    
    func getItems() -> [Order] {
        try! itemsSubject.value()
    }
    
    func setCurrent(
        _ order: Order
    ) {
        currentSubject.onNext(order)
    }
}
