//
//  AddressesView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 14/01/2024.
//

import SwiftUI

struct AddressesView: View {
    @StateObject var viewModel = AdressesViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeaderView(title: "Adresses")
            
            ForEach(viewModel.addresses.indices, id: \.self) { index in
                SingleSettingView(
                    viewModel.addresses[index].label == nil ? "Loading" : "\(viewModel.addresses[index].label): \(viewModel.addresses[index].value)",
                    displayEditing: $viewModel.displayEditing,
                    style: index == viewModel.activeAdressIndex ? ActiveStyles : InactiveStyles
                ) { newAddress in
                    viewModel.addressOnEditIdx = index
                } onActivate: { newAddress in
                    viewModel.setActive(index)
                } content: { newAddress in
                    VStack(alignment: .leading, spacing: 0) {
                        ScreenHeaderView(title: "Edit address")
                        Text("\(viewModel.addressOnEdit?.label ?? "")")
                        Text("\(viewModel.addressOnEdit?.value ?? "")")
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
