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
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            ScreenHeaderView(title: "Profile")
            
            ScrollView{
                row(
                    label: "Name"
                ) 
                row(
                    label: "Email"
                )
                row(
                    label: "Phone"
                )
                
                ForEach(vm.orders, id: \.id) { order in
                    Button {
                        vm.toOrder(order)
                    } label: {
                        HStack {
                            Text("\(order.id)")
                            Text("\(order.date)")
                            Text("\(order.goodsCount) for $\(order.totalFormatted)")
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
    
    @ViewBuilder func row(
        label: String = ""
    ) -> some View{
        SingleSettingView(
            label,
            displayEditing: .constant(false)
        ) { newAddress in
            
        } content: { newAddress in
            VStack(alignment: .leading, spacing: 0) {
                ScreenHeaderView(title: "Edit")
            }.padding(BASE_PADDING)
        }
    }
}

#Preview {
    ProfileScreenView()
}
