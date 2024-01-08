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
    @Published var items: [CartItem] = []
    let bag = DisposeBag()
    
    func loadCart(){
        cartProvider
            .items$
            .subscribe { [weak self] items in
                self?.items = items
                print("cahnged CheckoutScreenViewModel \(items)")
            }
            .disposed(by: bag )
    }
}
