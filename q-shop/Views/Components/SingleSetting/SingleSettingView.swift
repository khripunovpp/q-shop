//
//  SingleSettingView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct SingleSettingView<Content: View>: View {
    @Binding var displayEditing: Bool
    var label: String
    var change: (_ newValue: Int) -> Void
    private var content: () -> Content
    
    init(
        _ label: String,
        displayEditing: Binding<Bool>,
        change: @escaping (_ newValue: Int) -> Void,
        @ViewBuilder content: @escaping () -> Content
    ){
        self.label = label
        self.change = change
        self._displayEditing = displayEditing
        self.content = content
    }
    
    var body: some View {
        HStack{
            Text(label)
                .textStyle(RegularTextSyles)
                .onTapGesture {
                    displayEditing = true
                }
            Spacer()
            ChoiserView(
                "Edit",
                $displayEditing,
                textStyle: LinkTextSyles
            ) {
                content()
            }
            .padding(.leading, BASE_PADDING)
        }
        .padding(.bottom, BASE_PADDING)
    }
}

#Preview {
    SingleSettingView(
        "Rua. do Barao de Sao Cosme, 250, ap. 0.1, floor -1",
        displayEditing: .constant(false)
    ) { _ in
        
    } content: {
        Text("Sample inner")
    }
}
