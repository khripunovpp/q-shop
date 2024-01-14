//
//  AddressesProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//
import RxSwift

final class AddressesProvider {
    var addresses = AddressesEntity([
        Address(value: "Rua. do Barao de Sao Cosme, 250, ap. 0.1, floor -1", label: "Home"),
        Address(value: "Morskaya embankment 15, appartment 25", label: "Old St.P"),
        Address(value: "Microdistrict 1, build. 9, appartment 12", label: "Origin")
    ])
    private var activeAdressIndex = 0
    private var itemsSubject = BehaviorSubject<[Address]>(value: [])
    private var activeAddressSubject = ReplaySubject<Address>.create(bufferSize: 1)
    
    var activeIndex: Int {
        activeAdressIndex
    }
    
    var items: [Address] {
        addresses.list
    }
    
    var items$: Observable<[Address]> {
        itemsSubject.asObservable()
    }
    
    var activeAddress: Address {
        addresses.getOne(activeAdressIndex)
    }
    
    var activeAddress$: Observable<Address> {
        activeAddressSubject.asObservable()
    }
    
    
    init() {
        itemsSubject.onNext(addresses.list)
    }
    
    func add(
        _ value: Address
    ) {
        addresses.add(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: Address
    ) {
        addresses.edit(index, newValue)
    }
    
    func delete(
        _ index: Int
    ) {
        addresses.delete(index)
    }
    
    func setActive(
        _ index: Int
    ) {
        activeAdressIndex = index
        activeAddressSubject.onNext(activeAddress)
    }
}
