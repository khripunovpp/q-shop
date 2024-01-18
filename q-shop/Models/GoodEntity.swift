//
//  GoodEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation

protocol Good: Hashable, Identifiable, Equatable {
    var id: String { get }
    var name: String { get }
    var description: String { get }
    var price: Float { get }
    var count: Int { get set }
    var pictureName: String { get set }
}

struct GoodEntity: Good {
    var description: String = ""
    var id = UUID().uuidString
    let name: String
    let price: Float
    var count = 0
    var pictureName = ""
}

extension Good {
    var formattedPrice: String {
        formatPrice(self.price)
    }
}
