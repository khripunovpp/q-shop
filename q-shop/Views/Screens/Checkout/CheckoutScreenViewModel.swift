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
    @Injected var paymentAccountsProvider: PaymentAccountsProvider
    @Published var items: [CartItem] = []
    @Published var activeAddress: String = "Home"
    @Published var activePaymentAccount: String = "ApplePay"
    let bag = DisposeBag()
    
    init() {
        activeAddress = addressesProvider.activeAddress.label
        addressesProvider.activeAddress$.subscribe { [weak self] address in
            self?.activeAddress = address.label
        }.disposed(by: bag)
        
        activePaymentAccount = paymentAccountsProvider.activePaymentAccount
        paymentAccountsProvider.activePaymentAccount$.subscribe { [weak self] acc in
            self?.activePaymentAccount = acc
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
