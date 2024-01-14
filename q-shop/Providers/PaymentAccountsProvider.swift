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
        "ApplePay",
        "Bank transfer",
        "MBWay"
    ])
    private var activePaymentAccountIndex = 0
    private var itemsSubject = BehaviorSubject<[String]>(value: [])
    private var activePaymentAccountSubject = ReplaySubject<String>.create(bufferSize: 1)
    
    var activeIndex: Int {
        activePaymentAccountIndex
    }
    
    var items: [String] {
        paymentAccountes.list
    }
    
    var items$: Observable<[String]> {
        itemsSubject.asObservable()
    }
    
    var activePaymentAccount: String {
        paymentAccountes.getOne(activePaymentAccountIndex)
    }
    
    var activePaymentAccount$: Observable<String> {
        activePaymentAccountSubject.asObservable()
    }
    
    
    init() {
        itemsSubject.onNext(paymentAccountes.list)
    }
    
    func add(
        _ value: String
    ) {
        paymentAccountes.add(value)
    }
    
    func edit(
        _ index: Int,
        _ newValue: String
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
