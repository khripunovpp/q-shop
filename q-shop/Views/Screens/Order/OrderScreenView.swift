//
//  OrderScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 18/01/2024.
//

import SwiftUI

struct OrderScreenView: View {
    @State var goodDetails = false
    @State var goToOrders = false
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            ScreenHeaderView(title: "Thank you!")
            ScrollView {
                VStack {
                    Text("Order is beeing checked")
                        .textStyle(RegularTextSyles)
                    
                    GoodRowView(
                        GoodEntity(name: "aerv", price: 0.0),
                        count: .constant(0)
                    ) { _ in
                        goodDetails = true
                    } label: {
                        Text("Item 1").textStyle(RegularTextSyles)
                    }
                    
                    GoodRowView(
                        GoodEntity(name: "aerv", price: 0.0),
                        count: .constant(0)
                    ) { _ in
                        goodDetails = true
                    } label: {
                        Text("Total").textStyle(RegularTextSyles)
                    }
                    
                    
                    SimpleRowView {
                        Text("Total").textStyle(RegularTextSyles)
                    } content: {
                        Text("$0")
                            .textStyle(RegularTextSyles)
                    }
                    
                    SimpleRowView {
                        Text("Address").textStyle(RegularTextSyles)
                    } content: {
                        Text("aerberbara")
                            .textStyle(RegularTextSyles)
                    }
                    
                    SimpleRowView {
                        Text("Payed by").textStyle(RegularTextSyles)
                    } content: {
                        Text("aerberbara")
                            .textStyle(RegularTextSyles)
                    }
                }

            }
            Spacer()
            
            NavigationLink(isActive: $goToOrders) {
                ShowcaseScreenView().navigationBarBackButtonHidden()
            } label: {
                BrandButtonView(
                    label: "See other orders"
                ) {
                    goToOrders = true
                }
            }
        }.padding(EdgeInsets(
            top: VIEWPORT_PADDING_V,
            leading: VIEWPORT_PADDING_H,
            bottom: VIEWPORT_PADDING_V,
            trailing: VIEWPORT_PADDING_H
        ))
    }
}

#Preview {
    OrderScreenView()
}
