//
//  AddressesEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import Foundation

final class AddressesEntity {
    private var addresess: [String]
    
    init(_ addresess: [String]?) {
        self.addresess = addresess ?? []
    }
    
    func getOne(
        _ index: Int
    ) -> String {
        return addresess[index]
    }
    
    func add(
        _ value: String
    ) {
        addresess.append(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: String
    ) {
        addresess[index] = newValue
    }
    
    func delete(
        _ index: Int
    ) {
        addresess.remove(at: index)
    }
    
    var list: [String] {
        addresess
    }
}
