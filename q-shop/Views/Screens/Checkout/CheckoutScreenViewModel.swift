//
//  CheckoutScreenViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import RxSwift
import Resolver

class CheckoutScreenViewModel: ObservableObject {
    @Injected var cartProvider: CartProvider
    @Injected var addressesProvider: AddressesProvider
    @Published var items: [CartItem] = []
    @Published var activeAddress: String = "Home"
    let bag = DisposeBag()
    
    init() {
        activeAddress = addressesProvider.activeAddress
        addressesProvider.activeAddress$.subscribe { [weak self] address in
            self?.activeAddress = address
        }.disposed(by: bag)
    }
    
    func loadCart(){
        cartProvider
            .items$
            .subscribe { [weak self] items in
                self?.items = items
                print("cahnged CheckoutScreenViewModel \(items)")
            }
            .disposed(by: bag)
    }
}
