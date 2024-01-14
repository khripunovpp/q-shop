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
    private var activeAdress = 0 {
        didSet {
            address = addresses[activeAdress]
        }
    }
    @AppStorage("address") var address: String = ""
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeaderView(title: "Adresses")
            ForEach(addresses, id: \.self) { address in
                SingleSettingView(
                    address,
                    displayEditing: .constant(false)
                ) {newValue in
                    
                } content: {
                    VStack(spacing: 0) {
                        ScreenHeaderView(title: "Place fore editing")
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
