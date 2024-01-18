//
//  Helpers.swift
//  q-shop
//
//  Created by Khripunov Pavel on 18/01/2024.
//

import Foundation


func formatPrice(
    _ price: Float
) -> String {
    guard price >= 0.0 else {
        return "0"
    }
    return price.formatted(.number.precision(.fractionLength(2)))
}
