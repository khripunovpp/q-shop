//
//  ChoiserView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 11/01/2024.
//

import SwiftUI

struct ChoiserView<Content: View>: View {
    @Bindable var viewModel = ChoiserViewModel()
    @Binding var display: Bool
    var label: String
    var textStyle: TextStyle?
    private var content: () -> Content
    
    init(
        _ label: String,
        _ display: Binding<Bool>,
        textStyle: TextStyle?,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._display = display
        self.label = label
        self.textStyle = textStyle ?? RegularTextSyles
        self.content = content
    }
    
    var body: some View {
        Group {
            Button {
                display = true
            } label: {
                Text(label)
                    .textStyle(textStyle ?? RegularTextSyles)
                    .underline()
            }
        }.sheet(
            isPresented: $display
        ) {
            content()
        }
    }
}

#Preview {
    ChoiserView(
        "Title",
        .constant(true),
        textStyle: LinkTextSyles
    ) {
        Text("Sample")
    }
}
