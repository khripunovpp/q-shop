//
//  GoodItem.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI
import Resolver

struct GoodItem: View {
    @State var sheet = false
    var content: String
    var changed: (Int) -> Void
    var body: some View {
        ZStack{
            Image("pic\(content)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
                .allowsHitTesting(false)
            
            Group{
                VStack {
                    Spacer()
                    VStack{
                        Text(content)
                            .textStyle(GoodNameTextSyles)
                            .padding(.bottom, BASE_PADDING)
                        QuantityButton() { value in
                            changed(value)
                        }
                    }
                }
            }
            .padding(BASE_PADDING)
        }
        .onTapGesture {
            sheet = true
        }
        .sheet(isPresented: $sheet) {
            VStack(spacing: 0){
                Spacer()
                SingleGoodDetailsScreenView()
                    .presentationDetents([.fraction(0.3)])
            }
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
