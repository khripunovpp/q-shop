//
//  Showcase.swift
//  q-shop
//
//  Created by Khripunov Pavel on 09/01/2024.
//

import Foundation


struct ShowcaseItem: Good {
    var description: String = ""
    var id = UUID().uuidString
    let name: String
    let price: Float
    var count = 0
    var pictureName = ""
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
        _ item: ShowcaseItem
    ) {
        items[item.name] = item
    }
    
    func removeItemByName(_ name: String) {
        items.removeValue(forKey: name)
    }
    
    func setMany(
        _ items: [ShowcaseItem]
    ) {
        items.forEach{it in setItem(it)}
    }
}
