//
//  CartScreenViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import Resolver
import RxSwift

class CartScreenViewModel: ObservableObject {
    @Injected var cartProvider: CartProvider
    @Published var items: [CartItem] = []
    let bag = DisposeBag()
    
    func loadCart(){
        cartProvider
            .items$
            .subscribe { [weak self] items in
                self?.items = items
                print("cahnged CartScreenViewModel \(items)")
            }
            .disposed(by: bag )
    }
    deinit {
        print("dfeinit CartScreenViewModel")
    }
}
