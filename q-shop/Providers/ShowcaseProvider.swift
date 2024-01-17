//
//  ShowcaseProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import RxSwift
import Resolver

final class ShowcaseProvider {
    private let cartProvider: CartProvider = Resolver.resolve()
    private let showcase: Showcase
    private let productsSubject: BehaviorSubject<[ShowcaseItem]>
    
    init() {
        showcase = Showcase()
        showcase.setMany([
            ShowcaseItem(name: "Lemon-Basil", price: 3.50, count: 0, pictureName: "pic1"),
            ShowcaseItem(name: "Shocolate diplomat", price: 3.50, count: 0, pictureName: "pic2"),
            ShowcaseItem(name: "Berry", price: 2.50, count: 0, pictureName: "pic3"),
            ShowcaseItem(name: "Lemon-Lime", price: 3.0, count: 0, pictureName: "pic4")
        ])
        productsSubject = BehaviorSubject(value: [])
        emitItems()
    }
    
    var products$: Observable<[ShowcaseItem]> {
        Observable.combineLatest(
            cartProvider.items$,
            productsSubject.asObservable()
        ).map { [weak self] cart, products in
            self?.map(withCart: cart, for: products) ?? []
        }
    }
    
    
    private func map(
        withCart cartItems: [CartItem],
        for products: [ShowcaseItem]
    ) -> [ShowcaseItem] {
        var arr: [ShowcaseItem] = []
        for p in products {
            let res = cartItems.firstIndex(where: { $0.name == p.name })
            if res == nil {
                arr.append(p)
            } else {
                arr.append(ShowcaseItem(
                    name: p.name,
                    price: p.price,
                    count: cartItems[res!].count,
                    pictureName: p.pictureName
                ))
            }
        }
        
        return arr
    }
    
    
    func add(
        _ item: ShowcaseItem
    ) {
        showcase.setItem(item)
        emitItems()
    }
    
    func addMany(){
        showcase.setMany([])
    }
    
    func remove(
        _ item: ShowcaseItem
    ) {
        showcase.removeItemByName(item.name)
    }
    
    private func emitItems(){
        productsSubject.onNext(showcase.getGoods().sorted { a,b in a.name < b.name })
    }
}
