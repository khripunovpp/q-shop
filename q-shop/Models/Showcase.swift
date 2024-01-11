//
//  Showcase.swift
//  q-shop
//
//  Created by Khripunov Pavel on 09/01/2024.
//

import Foundation


struct ShowcaseItem: Hashable, Identifiable, Equatable {
    var id = UUID().uuidString
    let name: String
    var count = 0
    
    init(
        name: String,
        count: Int = 0
    ){
        self.name = name
        self.count = count
    }
}


// Класс описывающий сущность витрины, с ее товарами, ф ильтрами и прочим
final class Showcase {
    var empty: Bool {
        items.isEmpty
    }
    
    var keys: [String] {
        items.keys.map {i in String(i)}
    }
    
    private var items: [String: ShowcaseItem] = [:]
    private var sotting: (Field: String, Direction: SortingDirection) = ("name", .ASC)
    
    func getGoods() -> [ShowcaseItem] {
        return Array(items.values)
    }
    
    func setItem(
        _ name: String,
        _ count: Int
    ) {
        items[name] = ShowcaseItem(name: name, count: count)
    }
    
    func removeItem(_ name: String) {
        items.removeValue(forKey: name)
    }
    
    func setMany(
        _ items: [ShowcaseItem]
    ) {
        items.forEach{it in setItem(it.name, it.count)}
    }
}
