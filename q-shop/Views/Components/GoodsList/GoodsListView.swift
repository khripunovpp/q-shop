//
//  GoodsList.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI
import Resolver
import Foundation

struct ShowcaseItem {
    let name: String
    var count = 0
}

class GoodListItems: ObservableObject {
    @Published var items: [ShowcaseItem] = [
         .init(name: "1"),
         .init(name: "2"),
         .init(name: "3"),
         .init(name: "4")
     ]
}

struct GoodsListView: View {
    @ObservedObject var items: GoodListItems
    var colors: [Color] = [.red,.green,.blue,.purple]
    var verticalSpacing: CGFloat = BASE_PADDING
    var addedHadler: (String, Int) -> Void
    
    var body: some View {
        ScrollView() {
            VStack(spacing: verticalSpacing) {
                ForEach(items.items, id: \.name) { item in
                    GoodItemView(
                        content: item.name
                    ) { newQuantity in
                        addedHadler(item.name, newQuantity)
                    }
                }
            }
        }
        
    }
}

#Preview {
    GoodsListView(items: GoodListItems()) { _,_ in
        
    }
}
