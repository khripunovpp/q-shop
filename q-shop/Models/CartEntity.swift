//
//  CartEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//
import Foundation

struct CartItem: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var count: Int
}


final class Cart {
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
    
    func setItem(_ name: String, _ count: Int) {
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
