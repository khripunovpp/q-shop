//
//  SettingsRowView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct GoodRowView: View {
    @Binding var count: Int
    var label: String
    var change: (_ newValue: Int) -> Void
    
    init(
        _ label: String,
        count: Binding<Int>,
        change: @escaping (_ newValue: Int) -> Void
    ){
        self.label = label
        self.change = change
        self._count = count
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
    GoodRowView("", count: .constant(0)) { _ in
        
    }
}
