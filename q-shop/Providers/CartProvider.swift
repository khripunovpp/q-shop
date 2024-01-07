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
    private let itemsSubject = BehaviorSubject<[CartItem]>(value: [])
    
    var items$: Observable<[CartItem]> {
        itemsSubject.asObservable()
    }
    
    func add(
        _ name: String,
        _ count: Int
    ) {
        cart.addItem(name, count)
        print("cart \(cart.getItems())")
        itemsSubject.onNext(cart.getItems())
    }
    
    func remove(
        _ item: String
    ) {
        cart.removeItem(item)
    }
}
