//
//  SettingsRowView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct GoodRowView<Content: View>: View {
    @Binding var count: Int
    var good: any Good
    var change: (_ newValue: Int) -> Void
    var label: () -> Content
    
    init(
        _ good: any Good,
        count: Binding<Int>,
        change: @escaping (_ newValue: Int) -> Void,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.good = good
        self._count = count
        self.change = change
        self.label = label
    }
    
    var body: some View {
        HStack {
            label()
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
    GoodRowView(GoodEntity(name: "efv", price: 0.0), count: .constant(0)) { _ in } label: {
        Text("efv")
            .textStyle(RegularTextSyles)
    }
}
