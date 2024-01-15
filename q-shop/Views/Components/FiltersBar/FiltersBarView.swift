//
//  FiltersBar.swift
//  q-shop
//
//  Created by Khripunov Pavel on 29/12/2023.
//

import SwiftUI

enum SortType: String, CaseIterable {
    case price, weight
}

struct Sort {
    var type: SortType
    var label: String
}

struct FiltersBarView: View {
    
    @State var selectedSort = SortType.price.rawValue
    @State var selectedCount = 24
    
    var sortlist = [
        SortType.price.rawValue,
        SortType.weight.rawValue
    ]
    var countlist = [
        6,
        12,
        24,
        48
    ]
    var textColor = BrandColors.main
    
    var body: some View {
        HStack(spacing:0){
            Picker("Sorting", selection: $selectedSort) {
                ForEach(sortlist, id: \.self) { sorting in
                    Text(sorting)
                }
            }
            .accentColor(textColor)
            
            Picker("Count", selection: $selectedCount) {
                ForEach(countlist, id: \.self) { sorting in
                    Text("\(sorting)")
                }
            }
            .accentColor(textColor)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    FiltersBarView()
}
