//
//  OrderScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 18/01/2024.
//

import SwiftUI
import Resolver

struct OrderScreenView: View {
    @StateObject var viewModel = OrderViewModel()
    @State var goodDetails = false
    @InjectedObject var router: Router
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            ScreenHeaderView(title: "Thank you!")
            ScrollView {
                LazyVStack {
                    Text("Order is beeing checked")
                        .textStyle(RegularTextSyles)
                    
                    
                    ForEach(viewModel.items, id: \.id) { good in
                        GoodRowView(
                            good,
                            count: .constant(good.count)
                        ) { _ in
                            goodDetails = true
                        } label: {
                            Text(good.name).textStyle(RegularTextSyles)
                        }
                    }
                    
                    
                    SimpleRowView {
                        Text("Total").textStyle(RegularTextSyles)
                    } content: {
                        Text("$\(viewModel.total)")
                            .textStyle(RegularTextSyles)
                    }
                    
                    SimpleRowView {
                        Text("Address").textStyle(RegularTextSyles)
                    } content: {
                        Text("\(viewModel.address)")
                            .textStyle(RegularTextSyles)
                    }
                    
                    SimpleRowView {
                        Text("Payed by").textStyle(RegularTextSyles)
                    } content: {
                        Text("\(viewModel.paymentAccount)")
                            .textStyle(RegularTextSyles)
                    }
                }
                
            }
            Spacer()
            
            BrandButtonView(
                label: "See other orders"
            ) {
                router.navigate(to: .Orders)
            }
        }.padding(EdgeInsets(
            top: VIEWPORT_PADDING_V,
            leading: VIEWPORT_PADDING_H,
            bottom: VIEWPORT_PADDING_V,
            trailing: VIEWPORT_PADDING_H
        )).onAppear{
            viewModel.cartProvider.reset()
        }
    }
}

#Preview {
    OrderScreenView()
}
