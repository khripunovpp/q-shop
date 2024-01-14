//
//  PaymentsViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import RxSwift
import Foundation
import Resolver

final class PaymentsViewModel: ObservableObject {
    @Injected var paymentAccountsProvider: PaymentAccountsProvider
    let bag = DisposeBag()
    @Published var paymentAccounts: [String] = []
    @Published var displayEditing = false
    
    init() {
        activePaymentAccountIndex = paymentAccountsProvider.activeIndex
        paymentAccountsProvider.items$.subscribe{ [weak self] items in
            self?.activePaymentAccountIndex =  self?.paymentAccountsProvider.activeIndex ?? 0
            self?.paymentAccounts = items
            
            
            print("paymentAccounts changes \(items)")
        }.disposed(by: bag)
        
    }
    @Published var activePaymentAccountIndex: Int = 0 {
        didSet {
            activePaymentAccount =  paymentAccountsProvider.activePaymentAccount
        }
    }
    @Published var activePaymentAccount: String = ""
    @Published var paymentAccountOnEditIdx: Int = 0 {
        didSet {
            paymentAccountOnEdit = paymentAccounts[paymentAccountOnEditIdx]
        }
    }
    @Published var paymentAccountOnEdit: String = ""
    
    
    func setActive(
        _ index: Int
    ) {
        paymentAccountsProvider.setActive(index)
        activePaymentAccountIndex = paymentAccountsProvider.activeIndex
        
        print("new active index \(activePaymentAccountIndex)")
    }
    
    func onEdit(
        _ index: Int
    ){
        paymentAccountOnEditIdx = index
    }
}
