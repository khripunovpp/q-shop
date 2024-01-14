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
            .init(name: "1"),
            .init(name: "2"),
            .init(name: "3"),
            .init(name: "4")
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
        var arr:[ShowcaseItem] = []
        for p in products {
            let res = cartItems.firstIndex(where: { $0.name == p.name })
            if res == nil {
                    arr.append(ShowcaseItem(name: p.name, count: p.count))
            } else {
//                print("\n find this item in cart: \(p.name) \n index: \(res) \n item: \(cartItems[res!])")
                arr.append(ShowcaseItem(name: p.name, count: cartItems[res!].count))
            }
//                print("added to array result: \(arr)")
        }
        
        //        products.map{ p in
        //            let res = cartItems.firstIndex(where: { $0.name == p.name })
        //            guard res != nil else { return ShowcaseItem(name: p.name, count: p.count) }
        //            print("\n find this item in cart: \(p.name) \n index: \(res) \n item: \(cartItems[res!])")
        //            return ShowcaseItem(name: p.name, count: cartItems[res!].count)
        //        }
        return arr
    }
    
    
    func add(
        _ name: String,
        _ count: Int
    ) {
        showcase.setItem(name, count)
        emitItems()
    }
    
    func addMany(){
        showcase.setMany([])
    }
    
    func remove(
        _ item: String
    ) {
        showcase.removeItem(item)
    }
    
    private func emitItems(){
        productsSubject.onNext(showcase.getGoods().sorted { a,b in a.name < b.name })
    }
    
    func manualEmit(){
        print("manualEmit")
        emitItems()
    }
}
