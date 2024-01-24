//
//  OrderDetailsRowView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 24/01/2024.
//

import SwiftUI
import Resolver

struct OrderDetailsRowView: View {
    @InjectedObject var sheetRouter: SheetRouter
    @Injected var orderProvider: OrdersProvider
    @State var showDetails: Bool = false
    var order: Order?
    let action: () -> Void
    
    var body: some View {
        Button {
            guard order != nil else {
                return
            }
            orderProvider.setCurrent(order!)
            sheetRouter.to(.Order)
        } label: {
            HStack() {
                Text("\(order?.date.formatted() ?? "")")
                Spacer()
                Text("\(order?.goodsCount ?? 0) items for $\(order?.totalFormatted ?? "")")
            }
        }
        .buttonStyle(.plain).frame(maxWidth: .infinity)
    }
}

#Preview {
    OrderDetailsRowView {
        
    }
}
