//
//  SimpleRowView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 19/01/2024.
//

import SwiftUI

struct SimpleRowView<Content: View>: View {
    var label: () -> Content
    var content: () -> Content
    
    init(
        @ViewBuilder label: @escaping () -> Content,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.label = label
        self.content = content
    }
    
    var body: some View {
        HStack {
            label()
            Spacer()
            content()
        }
        .padding(.bottom, BASE_PADDING)
    }
}

#Preview {
    SimpleRowView() {
        
    } content: {
        
    }
}
