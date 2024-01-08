//
//  CartEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

struct CartItem:Hashable {
    var name: String
    var count: Int
}


class Cart {
    var empty: Bool {
        items.isEmpty
    }
    
    var keys: [String] {
        items.keys.map { i in String(i)}
    }
    
    private var items: [String: CartItem] = [:]
    
    func getItems() -> [CartItem] {
        return Array(items.values)
    }
    
    func addItem(_ name: String, _ count: Int) {
        guard count > 0 else {
            removeItem(name)
            return
        }
        
        if items[name] == nil {
            items[name] = CartItem(name: name, count: count)
        } else {
            items[name]!.count = count
        }
    }
    
    func removeItem(_ name: String) {
        items.removeValue(forKey: name)
    }
}
