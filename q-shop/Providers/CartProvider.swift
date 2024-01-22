//
//  CartProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 21/01/2024.
//

import Foundation
import RxSwift
import Resolver

struct CartProvider {
    let cart = Cart()
    private let itemsSubject = BehaviorSubject<[CartItem]>(value: [])
    
    var items$: Observable<[CartItem]> {
        itemsSubject.asObservable()
    }
    
    var count: Int {
        cart.getItems().count
    }
    
    var totalSumFormatted: String {
        formatPrice(cart.totalSum)
    }
    
    func add(
        _ item: any Good
    ) {
        cart.setItem(CartItem.parse(item))
        emitItems()
    }
    
    func remove(
        _ item: String
    ) {
        cart.removeItem(item)
    }
    
    private func emitItems() {
        itemsSubject.onNext(cart.getItems().sorted { a,b in a.name < b.name })
    }
    
    
    func reset(){
        cart.reset()
        emitItems()
    }
}
