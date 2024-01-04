//
//  CartScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct CartScreenView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            Text("Your order")
                .textStyle(TitleLvl1)
                .padding(.bottom, BASE_PADDING)
            
            ScrollView{
                HStack {
                    Text("Good 1")
                        .textStyle(RegularTextSyles)
                    Spacer()
                    QuantityButton().frame(width: 100)
                }.padding(.bottom, BASE_PADDING)
                
                HStack {
                    Text("Good 2")
                        .textStyle(RegularTextSyles)
                    Spacer()
                    QuantityButton().frame(width: 100)
                }.padding(.bottom, BASE_PADDING)
            }
            
            BrandButton(
                label: "Checkout",
                type: .big
            ) {
            }
            Spacer()
        }.padding(EdgeInsets(
            top: VIEWPORT_PADDING_V,
            leading: VIEWPORT_PADDING_H,
            bottom: VIEWPORT_PADDING_V,
            trailing: VIEWPORT_PADDING_H
        ))
    }
}

#Preview {
    CartScreenView()
}
