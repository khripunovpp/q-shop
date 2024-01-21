//
//  CartEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//
import Foundation

struct CartItem: Good {
    var description: String = ""
    var price: Float = 0.0
    var pictureName: String = ""
    var id: String = UUID().uuidString
    var name: String = ""
    var count: Int = 0
    
    static func parse(_ anyGood: any Good) -> CartItem {
        CartItem(
            price: anyGood.price,
            pictureName: anyGood.pictureName,
            name: anyGood.name,
            count: anyGood.count
        )
    }
}


final class Cart {
    var empty: Bool {
        items.isEmpty
    }
    
    var keys: [String] {
        items.keys.map { i in String(i)}
    }
    
    var totalSum: Float {
        getItems().reduce(0.0) { acc, item in  acc + (Float(item.count) * item.price) }
    }
    
    private var items: [String: CartItem] = [:]
    
    func getItems() -> [CartItem] {
        return Array(items.values)
    }
    
    func setItem(_ item: CartItem) {
        guard item.count > 0 else {
            removeItem(item.name)
            return
        }
        
        items[item.name] = item
    }
    
    func removeItem(_ name: String) {
        items.removeValue(forKey: name)
    }
}
