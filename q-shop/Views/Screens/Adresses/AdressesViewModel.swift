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
    @Published var addresses: [String] = []
    @Published var displayEditing = false
    
    init() {
        addressesProvider.items$.subscribe{ [weak self] items in
            self?.addresses = items
            
            
            print("addresses changes \(items)")
        }.disposed(by: bag)
        
        activeAdressIndex = addressesProvider.activeIndex
    }
    @Published var activeAdressIndex: Int = 0
    @Published var addressOnEditIdx: Int = 0 {
        didSet {
            addressOnEdit = addresses[addressOnEditIdx]
        }
    }
    @Published var addressOnEdit: String = ""
    
    
    func setActvie(
        _ index: Int
    ) {
        addressesProvider.setActive(index)
        activeAdressIndex = index
    }
    
    func onEdit(
        _ index: Int
    ){
        addressOnEditIdx = index
    }
}
