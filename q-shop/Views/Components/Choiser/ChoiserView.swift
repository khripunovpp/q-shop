//
//  ChoiserView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 11/01/2024.
//

import SwiftUI

struct ChoiserView: View {
    @Binding var display: Bool
    @Bindable var viewModel = ChoiserViewModel()
    let title: String
    let textStyle: TextStyle
    
    var body: some View {
        Group {
            Button {
                display = true
                print("taped", display)
            } label: {
                Text(title)
                    .textStyle(textStyle)
                    .underline()
            }
        }.sheet(isPresented: $display) {
            Text("aerga")
        }
    }
}

#Preview {
    ChoiserView(
        display: .constant(false),
        title: "Title",
        textStyle: LinkTextSyles
    )
}
