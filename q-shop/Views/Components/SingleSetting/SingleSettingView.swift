//
//  SingleSettingView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct BoxStyles {
    var borderColor: Color = .white
    var border: CGFloat = 0
}

struct SingleSettingView<Content: View>: View {
    @Binding var displayEditing: Bool
    var label: String
    var onEdit: (_ newValue: String) -> Void
    var onActivate: (_ value: String) -> Void
    private var content: (String) -> Content
    var style: BoxStyles
    
    init(
        _ label: String,
        displayEditing: Binding<Bool>,
        style: BoxStyles = BoxStyles(),
        onActivate: @escaping (_ value: String) -> Void = {_ in },
        onEdit: @escaping (_ newValue: String) -> Void = {_ in },
        @ViewBuilder content: @escaping (_:String) -> Content
    ){
        self.label = label
        self.onEdit = onEdit
        self.onActivate = onActivate
        self._displayEditing = displayEditing
        self.content = content
        self.style = style
    }
    
    var body: some View {
        HStack{
            Group {
                Text(label)
                    .textStyle(RegularTextSyles)
            }
            .frame(maxWidth:  .infinity, alignment: .leading)
            .onTapGesture {
                onActivate(label)
            }
            
            ChoiserView(
                "Edit",
                $displayEditing,
                textStyle: LinkTextSyles
            ) {
                displayEditing = true
                onEdit(label)
            } onDismiss: {
                
            } content: {
                content(label)
            }
        }
        .border(style.borderColor, width: style.border)
        .padding(.bottom, BASE_PADDING)
    }
}

#Preview {
    VStack {
        SingleSettingView(
            "Rua. do Barao de Sao Cosme, 250, ap. 0.1, floor -1",
            displayEditing: Binding(
                get: { false }, set: { _ in false })
        ) { address in
            Text(address)
        }
        SingleSettingView(
            "Rua.",
            displayEditing: Binding(
                get: { false }, set: { _ in false })
        ) { address in
            Text(address)
        }
    }
}
