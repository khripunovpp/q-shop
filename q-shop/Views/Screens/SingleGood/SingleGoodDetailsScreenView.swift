//
//  SingleGoodDetailsScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct SingleGoodDetailsScreenView: View {
    @State var count = 0 {
        didSet {
            model.count = count
        }
    }
    @State var model: any Good
    var changed: (any Good) -> Void
    
    var body: some View {
        VStack{
            Text(model.name)
                .textStyle(GoodNameTextSyles)
            Text(model.description)
                .textStyle(RegularTextSyles)
                .padding(.bottom, BASE_PADDING)
            QuantityButtonView(count: $count) { c in
                count = c
                changed(model)
            }
        }.padding(BASE_RADIUS)
    }
}

#Preview {
    SingleGoodDetailsScreenView(
        count: 0,
        model: GoodEntity(name: "", price: 0.0)
    ) { _ in
        
    }
}
