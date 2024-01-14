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
    var addedHadler: (String, Int) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: verticalSpacing) {
                ForEach(items.indices, id: \.self) { index in
                    GoodItemView(
                        count: $items[index].count,
                        content: items[index].name
                    ) { newQuantity in
                        addedHadler(items[index].name, newQuantity)
                    }
                }
            }
        }
        
    }
}

#Preview {
    GoodsListView(items: .constant([])) { _,_ in
        
    }
}
