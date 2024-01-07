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
    @Published var items = []
    let bag = DisposeBag()
    
    init(){
        cartProvider
            .items$
            .subscribe { [weak self] items in
                self?.items = items
            }
            .disposed(by: bag )
    }
}
