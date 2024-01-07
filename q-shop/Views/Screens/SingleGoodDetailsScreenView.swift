//
//  SingleGoodDetailsScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct SingleGoodDetailsScreenView: View {
    var body: some View {
        VStack{
           Text("Name")
                .textStyle(GoodNameTextSyles)
           Text("Description")
                .textStyle(RegularTextSyles)
                .padding(.bottom, BASE_PADDING)
            QuantityButton() { _ in }
        }
    }
}

#Preview {
    SingleGoodDetailsScreenView()
}
