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
    @Injected var ordersProvider: OrdersProvider
    @Published var items: [CartItem] = []
    @Published var totalFormatted: String = "0"
    @Published var activeAddress: String = "Home"
    @Published var activePaymentAccount: String = "ApplePay"
    private var order: Order? = nil
    
    let bag = DisposeBag()
    
    init() {
        activeAddress = addressesProvider.activeAddress.label
        addressesProvider.activeAddress$.subscribe { [weak self] address in
            self?.activeAddress = address.label
        }.disposed(by: bag)
        
        activePaymentAccount = paymentAccountsProvider.activePaymentAccount.label!
        paymentAccountsProvider.activePaymentAccount$.subscribe { [weak self] acc in
            self?.activePaymentAccount = acc.label ?? ""
        }.disposed(by: bag)
    }
    
    func loadCart(){
        cartProvider
            .items$
            .subscribe { [weak self] items in
                self?.items = items
                print("\nset items \(items)\n")
                self?.totalFormatted = self?.cartProvider.totalSumFormatted ?? ""
                print("set total \( self?.totalFormatted ?? "")")
            }
            .disposed(by: bag)
    }
    
    func createOrder() {
        order = ordersProvider.create(
            cartProvider.cart,
            withPayment: paymentAccountsProvider.activePaymentAccount,
            to: addressesProvider.activeAddress
        )
    }
    
    func resetCart(){
        cartProvider.reset()
    }
}
