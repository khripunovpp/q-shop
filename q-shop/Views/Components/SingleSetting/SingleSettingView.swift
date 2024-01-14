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
    var onEdit: (_ newValue: String) -> Void
    private var content: (String) -> Content
    
    init(
        _ label: String,
        displayEditing: Binding<Bool>,
        onEdit: @escaping (_ newValue: String) -> Void,
        @ViewBuilder content: @escaping (_:String) -> Content
    ){
        self.label = label
        self.onEdit = onEdit
        self._displayEditing = displayEditing
        self.content = content
    }
    
    var body: some View {
        HStack{
            Text(label)
                .textStyle(RegularTextSyles)
                .onTapGesture {
                    displayEditing = true
                    onEdit(label)
                }
            Spacer()
            ChoiserView(
                "Edit",
                $displayEditing,
                textStyle: LinkTextSyles
            ) {
                print("on show \(label) editing")
                onEdit(label)
            } onDismiss: {
                onEdit(label)
            } content: {
                content(label)
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
        
    } content: { address in
        Text(address)
    }
}
