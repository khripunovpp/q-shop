//
//  PaymentAccountsProvider.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import Foundation
import RxSwift

final class PaymentAccountsProvider {
    var paymentAccountes = PaymentAccountsEntity([
        PaymentAccount(label: "ApplePay", paymentMethod: PaymentMethod.ApplePay),
        PaymentAccount(label: "Bank transfer", paymentMethod: PaymentMethod.BankTransfer),
        PaymentAccount(label: "MBWay", paymentMethod: PaymentMethod.MBWay)
    ])
    private var activePaymentAccountIndex = 0
    private var itemsSubject = BehaviorSubject<[PaymentAccount]>(value: [])
    private var activePaymentAccountSubject = ReplaySubject<PaymentAccount>.create(bufferSize: 1)
    
    var activeIndex: Int {
        activePaymentAccountIndex
    }
    
    var items: [PaymentAccount] {
        paymentAccountes.list
    }
    
    var items$: Observable<[PaymentAccount]> {
        itemsSubject.asObservable()
    }
    
    var activePaymentAccount: PaymentAccount {
        paymentAccountes.getOne(activePaymentAccountIndex)
    }
    
    var activePaymentAccount$: Observable<PaymentAccount> {
        activePaymentAccountSubject.asObservable()
    }
    
    
    init() {
        itemsSubject.onNext(paymentAccountes.list)
    }
    
    func add(
        _ value: PaymentAccount
    ) {
        paymentAccountes.add(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: PaymentAccount
    ) {
        paymentAccountes.edit(index, newValue)
    }
    
    func delete(
        _ index: Int
    ) {
        paymentAccountes.delete(index)
    }
    
    func setActive(
        _ index: Int
    ) {
        activePaymentAccountIndex = index
        activePaymentAccountSubject.onNext(activePaymentAccount)
    }
}
