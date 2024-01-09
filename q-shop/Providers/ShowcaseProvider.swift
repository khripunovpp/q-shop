//
//  ShowcaseProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import RxSwift

class ShowcaseProvider {
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
        productsSubject.asObservable()
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
        var fd = showcase.getGoods()
        fd = fd.map{pr in ShowcaseItem(name: UUID().uuidString, count: pr.count)}
        productsSubject.onNext(fd.sorted { a,b in a.name < b.name })
    }
    
    func manualEmit(){
        print("manualEmit")
        emitItems()
    }
}
