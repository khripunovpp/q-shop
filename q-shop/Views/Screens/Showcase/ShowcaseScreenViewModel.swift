//
//  ShowcaseScreenViewModel.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Observation
import Resolver
import RxSwift

@Observable class ShowcaseScreenViewModel {
    let cartProvider: CartProvider = Resolver.resolve()
    let showcaseProvider: ShowcaseProvider = Resolver.resolve()
    var showcaseItems: [ShowcaseItem] = []
    let bag = DisposeBag()
    
    init(){
        showcaseProvider.products$.subscribe { [weak self] products in
            self?.showcaseItems = products
            print("\n cahnged ShowcaseScreenViewModel \n products: \n \(products) \n showcaseItems: \n  \(self?.showcaseItems)")
        }
        .disposed(by: bag )
    }
    
    var count: Int {
        cartProvider.count
    }
    
    deinit {
        print("dfeinit ShowcaseScreenViewModel")
    }
}
