//
//  GoodItem.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI

struct GoodItem: View {
    var width: CGFloat
    var height: CGFloat
    var content: String
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(.white)
            Text(content).foregroundColor(.black)
        }
    }
}

#Preview {
    GoodItem(
        width: .infinity,
        height: 170,
        content: "12"
    )
}
