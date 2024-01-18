//
//  SettingsRowView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct GoodRowView<Content: View>: View {
    @Binding var count: Int
    var label: String
    var price: Float
    var change: (_ newValue: Int) -> Void
    var content: () -> Content
    
    init(
        _ label: String,
        count: Binding<Int>,
        price: Float,
        change: @escaping (_ newValue: Int) -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.label = label
        self.price = price
        self._count = count
        self.change = change
        self.content = content
    }
    
    var body: some View {
        HStack {
            Text(label)
                .textStyle(RegularTextSyles)
            Spacer()
            QuantityButtonView(
                count: $count
            ) { newCount in
                change(newCount)
            }
            .frame(width: 100)
        }
        .padding(.bottom, BASE_PADDING)
    }
}

#Preview {
    GoodRowView("", count: .constant(0), price: 0.0) { _ in } content: {
        
        
    }
}
