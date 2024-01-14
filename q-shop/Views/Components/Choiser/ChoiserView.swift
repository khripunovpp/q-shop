//
//  ChoiserView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 11/01/2024.
//

import SwiftUI

struct ChoiserView<Content: View>: View {
    @Binding var display: Bool
    var label: String
    var textStyle: TextStyle?
    private var content: () -> Content
    private var onShow: () -> Void
    private var onDismiss: () -> Void
    
    init(
        _ label: String,
        _ display: Binding<Bool>,
        textStyle: TextStyle?,
        onShow: @escaping () -> Void,
        onDismiss: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._display = display
        self.label = label
        self.textStyle = textStyle ?? RegularTextSyles
        self.content = content
        self.onShow = onShow
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        Group {
            Button {
                display = true
                onShow()
            } label: {
                Text(label)
                    .textStyle(textStyle ?? RegularTextSyles)
                    .underline()
            }
        }.sheet(
            isPresented: $display,
            onDismiss: {
                onDismiss()
            }
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
        
    } onDismiss: {
        
    } content: {
        Text("Sample")
    }
}
