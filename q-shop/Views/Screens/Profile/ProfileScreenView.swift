//
//  ProfileScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI
import Resolver

struct ProfileScreenView: View {
    @StateObject private var vm = ProfileScreenViewModel()
    
    var body: some View {
        VStack {
            ScreenHeaderView(title: "Profile")
            
            ScrollView{
                VStack( alignment: .leading,
                        spacing: 0) {
                    ProfileSettingsView(label: "Name")
                    ProfileSettingsView(label: "Email")
                    ProfileSettingsView(label: "Phone")
                    
                    ForEach(vm.orders, id: \.id) { order in
                        OrderDetailsRowView(order: order) {
                            
                        }
                    }
                }
            }
        }.padding(EdgeInsets(
            top: VIEWPORT_PADDING_V,
            leading: VIEWPORT_PADDING_H,
            bottom: VIEWPORT_PADDING_V,
            trailing: VIEWPORT_PADDING_H
        ))
        .onAppear(){
            //            viewModel.loadCart()
        }
    }
}

#Preview {
    ProfileScreenView()
}
