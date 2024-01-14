//
//  AddressesEntity.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import Foundation

final class AddressesEntity {
    private var addresess: [Address]
    
    init(_ addresess: [Address]?) {
        self.addresess = addresess ?? []
    }
    
    func getOne(
        _ index: Int
    ) -> Address {
        return addresess[index]
    }
    
    func add(
        _ value: Address
    ) {
        addresess.append(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: Address
    ) {
        addresess[index] = newValue
    }
    
    func delete(
        _ index: Int
    ) {
        addresess.remove(at: index)
    }
    
    var list: [Address] {
        addresess
    }
}
