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
        cart.setItem(name, count)
        emitItems()
    }
    
    func remove(
        _ item: String
    ) {
        cart.removeItem(item)
    }
    
    private func emitItems(){
        
        itemsSubject.onNext(cart.getItems().sorted { a,b in a.name < b.name })
    }
}
