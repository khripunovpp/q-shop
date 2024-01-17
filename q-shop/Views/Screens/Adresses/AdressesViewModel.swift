//
//  AdressesViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import Foundation
import Resolver
import SwiftUI
import RxSwift


final class AdressesViewModel: ObservableObject {
    @Injected var addressesProvider: AddressesProvider
    let bag = DisposeBag()
    @Published var addresses: [Address] = []
    @Published var displayEditing = false
    
    init() {
        activeAdressIndex = addressesProvider.activeIndex 
        addressesProvider.items$.subscribe{ [weak self] items in
            self?.activeAdressIndex =  self?.addressesProvider.activeIndex ?? 0
            self?.addresses = items
        }.disposed(by: bag)
        
    }
    @Published var activeAdressIndex: Int = 0 {
        didSet {
            activeAdress = addressesProvider.activeAddress
        }
    }
    @Published var activeAdress: Address?
    @Published var addressOnEditIdx: Int = 0 {
        didSet {
            addressOnEdit = addresses[addressOnEditIdx]
        }
    }
    @Published var addressOnEdit: Address?
    
    
    func setActive(
        _ index: Int
    ) {
        addressesProvider.setActive(index)
        activeAdressIndex = addressesProvider.activeIndex
    
    }
    
    func onEdit(
        _ index: Int
    ){
        addressOnEditIdx = index
    }
}
