//
//  AddressesProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//
import RxSwift

final class AddressesProvider {
    var addresses = AddressesEntity([
        "Rua. do Barao de Sao Cosme, 250, ap. 0.1, floor -1",
        "Morskaya embankment 15, appartment 25",
        "Microdistrict 1, build. 9, appartment 12"
    ])
    private var activeAdressIndex = 0
    private var itemsSubject = BehaviorSubject<[String]>(value: [])
    private var activeAddressSubject = ReplaySubject<String>.create(bufferSize: 1)
    
    var activeIndex: Int {
        activeAdressIndex
    }
    
    var items: [String] {
        addresses.list
    }
    
    var items$: Observable<[String]> {
        itemsSubject.asObservable()
    }
    
    var activeAddress: String {
        addresses.getOne(activeAdressIndex)
    }
    
    var activeAddress$: Observable<String> {
        activeAddressSubject.asObservable()
    }
    
    
    init() {
        itemsSubject.onNext(addresses.list)
    }
    
    func add(
        _ value: String
    ) {
        addresses.add(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: String
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
