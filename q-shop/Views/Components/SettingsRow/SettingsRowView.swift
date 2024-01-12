//
//  SettingsRowView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct SettingsRowView<Content: View>: View {
    @Binding var displaySettings: Bool
    var label: String
    var change: (_ newValue: Int) -> Void
    var value: String
    private var content: () -> Content
    
    init(
        _ label: String,
        displaySettings: Binding<Bool>,
        value: String,
        change: @escaping (_ newValue: Int) -> Void,
        @ViewBuilder content: @escaping () -> Content
    ){
        self.label = label
        self.change = change
        self._displaySettings = displaySettings
        self.value = value
        self.content = content
    }
    
    var body: some View {
        HStack{
            Text(label)
                .textStyle(RegularTextSyles)
                .onTapGesture {
                    displaySettings = true
                }
            Spacer()
            ChoiserView(
                value,
                $displaySettings,
                textStyle: LinkTextSyles
            ) {
                content()
            }
        }.padding(.bottom, BASE_PADDING)
    }
}

#Preview {
    SettingsRowView(
        "Address",
        displaySettings: .constant(true),
        value: "Home"
    ) { _ in
        
    } content: {
        Text("Sample inner")
    }
}
