//
//  OrderEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation


class Order: Codable, Identifiable {
    let id: UUID
    let date: Date
    let items: [String:Int]?
    init() {
        id = UUID()
        date = Date()
        items = nil
    }
}
