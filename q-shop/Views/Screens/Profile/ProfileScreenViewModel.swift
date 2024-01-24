//
//  ProfileScreenViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import Resolver
import RxSwift

class ProfileScreenViewModel: ObservableObject {
    @Injected private var ordersProvider: OrdersProvider
    @InjectedObject private var router: Router
    @Published var orders: [Order] = []
    private let bag = DisposeBag()
    
    init(){
        ordersProvider.items$.subscribe { items in
            self.orders = items
        }.disposed(by: bag)
    }
    
    func toOrder(
        _ order: Order
    ){
        ordersProvider.setCurrent(order)
        router.navigate(to: .Order)
    }
}
