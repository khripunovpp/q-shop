//
//  ShowcaseScreenViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import Resolver
import RxSwift

class ShowcaseScreenViewModel: ObservableObject {
    @Injected var cartProvider: CartProvider
    @Injected var showcaseProvider: ShowcaseProvider
    @Published var cartItems: [CartItem] = []
    @Published var showcaseItems: [ShowcaseItem] = []
    let bag = DisposeBag()
    
    init(){
        Observable.combineLatest(
            cartProvider.items$,
            showcaseProvider.products$
        ).subscribe { [weak self] cartItems, products in
            
            self?.cartItems = cartItems
            self?.showcaseItems = []
            for p in products {
                self?.showcaseItems.append(ShowcaseItem(name: UUID().uuidString, count: p.count))
            }
            print("cahnged ShowcaseScreenViewModel cartItems:\(cartItems) \n showcaseItems\(products)")
    }
    .disposed(by: bag )
    }
}
