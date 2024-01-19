//
//  SettingsRowView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct GoodRowView<Content: View>: View {
    @Binding var count: Int
    let changableMode: Bool
    var good: any Good
    var change: (_ newValue: Int) -> Void
    var label: () -> Content
    
    init(
        _ good: any Good,
        count: Binding<Int>,
        changableMode: Bool? = false,
        change: @escaping (_ newValue: Int) -> Void,
        @ViewBuilder label: @escaping () -> Content
    ) {
        self.good = good
        self._count = count
        self.change = change
        self.label = label
        self.changableMode = changableMode ?? false
    }
    
    var body: some View {
        HStack {
            label()
            Spacer()
            if changableMode {
                QuantityView(
                    count: $count,
                    compactMode: true
                ) { newCount in
                    change(newCount)
                }
                .frame(maxWidth: 100)
            }  else {
                Text("\(count)")
            }
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
