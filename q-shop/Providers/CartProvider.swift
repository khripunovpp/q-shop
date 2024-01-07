//
//  CartProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import RxSwift

final class CartProvider {
    private let cart = Cart()
    private let itemsSubject = BehaviorSubject<[String]>(value: [])
    
    var items$: Observable<[String]> {
        itemsSubject.asObservable()
    }
    
    func add(
        _ name: String,
        _ count: Int
    ) {
        cart.addItem(name, count)
        itemsSubject.onNext(cart.keys)
    }
    
    func remove(
        _ item: String
    ) {
        cart.removeItem(item)
    }
}
