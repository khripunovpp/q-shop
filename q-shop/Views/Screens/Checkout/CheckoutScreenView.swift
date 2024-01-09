//
//  CheckoutScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct CheckoutScreenView: View {
    @StateObject var viewModel = CheckoutScreenViewModel()
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ){
            Text("Total")
                .textStyle(TitleLvl1)
                .padding(.bottom, BASE_PADDING)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.items.indices, id: \.self) { index in
                        HStack {
                            Text("\(viewModel.items[index].name)")
                                .textStyle(RegularTextSyles)
                            Spacer()
                            QuantityButtonView(
                                count: $viewModel.items[index].count
                            ) { newCount in
                                viewModel.cartProvider.add(viewModel.items[index].name, newCount)
                            }
                                .frame(width: 100)
                        }
                        .padding(.bottom, BASE_PADDING)
                    }
                }
                
                VStack {
                    HStack{
                        Text("Address")
                            .textStyle(RegularTextSyles)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Home")
                                .textStyle(LinkTextSyles)
                                .underline()
                        }
                    }.padding(.bottom, BASE_PADDING)
                    
                    HStack{
                        Text("Payment")
                            .textStyle(RegularTextSyles)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("ApplePay")
                                .textStyle(LinkTextSyles)
                                .underline()
                        }
                    }.padding(.bottom, BASE_PADDING)
                }
            }
            
            BrandButtonView(
                label: "Pay",
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
        .onAppear(){
            viewModel.loadCart()
        }
    }
}

#Preview {
    CheckoutScreenView()
}
