//
//  GoodItem.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI
import Resolver

struct GoodItem: View {
    var content: String
    var changed: (Int) -> Void
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.hex("#eeeeee"))
                .cornerRadius(5.0)
            Group{
                VStack {
                    Spacer()
                    Text(content)
                        .textStyle(GoodNameTextSyles)
                        .padding(.bottom, BASE_PADDING)
                    QuantityButton() { value in
                        changed(value)
                    }
                }
            }.padding(BASE_PADDING)
        }
    }
}

#Preview {
    GoodItem(
        content: "12"
    ) { v in
        
    }.frame(
        width: 200,
        height: 200
    )
}
