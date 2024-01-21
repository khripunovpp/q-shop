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
    private let cart = Cart()
    private let itemsSubject = BehaviorSubject<[CartItem]>(value: [])
    var items$: Observable<[CartItem]> {
        itemsSubject.asObservable()
    }
    
    var count: Int {
        cart.getItems().count
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
    
    private func emitItems() {
        itemsSubject.onNext(cart.getItems().sorted { a,b in a.name < b.name })
    }
    
    
    func reset(){
        
    }
}
