//
//  GoodsList.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI
import Resolver
import Foundation

struct GoodsListView: View {
    @Binding var items: [ShowcaseItem]
    var verticalSpacing: CGFloat = BASE_PADDING
    var horizontalSpacing: CGFloat = BASE_PADDING
    var addedHadler: (any Good) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(items.indices, id: \.self) { index in
                    GoodItemView(
                        count: $items[index].count,
                        model: items[index]
                    ) { newQuantity in
                        addedHadler(items[index])
                    }.padding(EdgeInsets(top: 0, leading: horizontalSpacing, bottom: verticalSpacing, trailing: horizontalSpacing))
                }
            }
        }
        
    }
}

#Preview {
    GoodsListView(items: .constant([
        ShowcaseItem(name: "1", price: 0.0, count: 0),
        ShowcaseItem(name: "2", price: 0.0, count: 0),
        ShowcaseItem(name: "3", price: 0.0, count: 0),
        ShowcaseItem(name: "4", price: 0.0, count: 0),
    ])) { _ in
        
    }
}
