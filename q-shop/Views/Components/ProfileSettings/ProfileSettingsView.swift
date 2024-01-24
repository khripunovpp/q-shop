//
//  ProdileSettingsView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 24/01/2024.
//

import SwiftUI

struct ProfileSettingsView: View {
    @StateObject var vm = ProfileSettingsViewModel()
    @State var editState: Bool = false
    var label: String
    var body: some View {
        SingleSettingView(
            label,
            displayEditing: $editState
        ) { newAddress in
            
        } content: { newAddress in
            VStack(alignment: .leading, spacing: 0) {
                ScreenHeaderView(title: "Edit \(label)")
            }.padding(BASE_PADDING)
        }
    }
}

#Preview {
    ProfileSettingsView(label: "")
}
