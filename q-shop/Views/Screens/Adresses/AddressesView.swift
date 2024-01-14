//
//  AddressesView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import SwiftUI

struct AddressesView: View {
    let addresses = [
        "Rua. do Barao de Sao Cosme, 250, ap. 0.1, floor -1",
        "Morskaya embankment 15, appartment 25",
        "Microdistrict 1, build. 9, appartment 12"
    ]
    @State var activeAdressIndex = 0 {
        didSet {
            activeAddress = addresses[activeAdressIndex]
            addressStored = activeAddress
        }
    }
    @AppStorage("address") var addressStored: String = ""
    @State var displayEditing = false
    @State var activeAddress: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeaderView(title: "Adresses")
            ForEach(addresses.indices, id: \.self) { index in
                SingleSettingView(
                    addresses[index],
                    displayEditing: $displayEditing
                ) {newAddress in
                    print("newAddress \(newAddress)")
                    activeAdressIndex = index
                } content: { newAddress in
                    VStack(spacing: 0) {
                        ScreenHeaderView(title: "Edit address")
                        Text(activeAddress)
                        Spacer()
                    }.padding(BASE_PADDING)
                }
            }
            Spacer()
        }.padding(BASE_PADDING)
    }
}

#Preview {
    AddressesView()
}
