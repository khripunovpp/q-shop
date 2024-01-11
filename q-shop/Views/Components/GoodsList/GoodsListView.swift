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
        ScrollView() {
            VStack(spacing: verticalSpacing) {
                ForEach(items) { item in
                    GoodItemView(
                        content: item.name
                    ) { newQuantity in
                        addedHadler(item.name, newQuantity)
                    }
                }
            }.onAppear() {
                print("GoodsListView has appeared")
            }
        }
        
    }
}

#Preview {
    GoodsListView(items: .constant([])) { _,_ in
        
    }
}
