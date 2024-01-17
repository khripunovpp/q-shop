//
//  SingleGoodDetailsScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct SingleGoodDetailsScreenView: View {
    @State var count = 0
    @Binding var name: String
    @Binding var description: String
    var changed: (Int) -> Void
    
    var body: some View {
        VStack{
           Text(name)
                .textStyle(GoodNameTextSyles)
           Text(description)
                .textStyle(RegularTextSyles)
                .padding(.bottom, BASE_PADDING)
            QuantityButtonView(count: $count) { c in changed(c) }
        }.padding(BASE_RADIUS)
    }
}

#Preview {
    SingleGoodDetailsScreenView(
        name: .constant("Name"), description: .constant("Description")
    ) { _ in
        
    }
}
