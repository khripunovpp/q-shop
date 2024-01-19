//
//  OrderViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 18/01/2024.
//

import Foundation
import Resolver
import RxSwift

class OrderViewModel: ObservableObject {
    let ordersProvider: OrdersProvider
    var order: Order?
    @Published var items: [any Good] = []
    @Published var address: String = ""
    @Published var paymentAccount: String = ""
    @Published var total: String = "0"
    let bag = DisposeBag()
    
    init() {
        ordersProvider = Resolver.resolve()
        ordersProvider.current$.subscribe{[weak self] currentOrder in
            self?.order = currentOrder
            print("order \(self?.order?.id)")
            self?.items = self?.order?.getITems() ?? []
            self?.address = self?.order?.addressLabel ?? ""
            self?.paymentAccount = self?.order?.paymentAccountLabel ?? ""
            self?.total = formatPrice(self?.order?.total ?? 0.0)
        }.disposed(by: bag)
    }
}
