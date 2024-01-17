//
//  GoodItem.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI
import Foundation
import Resolver

struct GoodItemView: View {
    @State var sheet = false
    @Binding var count: Int
    @State var name: String
    @State var price: Float {
        didSet {
            print("price set \(price) for \(name)")
        }
    }
    @State var pictureName: String
    
    var changed: (Int) -> Void
    
    var body: some View {
        ZStack{
            Group {
                Image(pictureName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .allowsHitTesting(false)
                
                Group{
                    VStack {
                        Spacer()
                        VStack{
                            Text(name)
                                .textStyle(GoodNameTextSyles)
                            Text(price.formatted(.number.precision(.fractionLength(2))))
                                .textStyle(GoodNameTextSyles)
                                .padding(.bottom, BASE_PADDING)
                            QuantityButtonView(count: $count) { value in
                                count = value
                                changed(value)
                            }
                        }
                    }
                }
                .padding(BASE_PADDING)
            }.clipShape(RoundedRectangle(
                cornerRadius: BASE_RADIUS
            ))
            .onTapGesture { loc in
                sheet = true
            }
        }
        .sheet(isPresented: $sheet) {
            VStack(spacing: 0){
                Spacer()
                SingleGoodDetailsScreenView(
                    count: count, name: $name, description: $name) { newCount in
                        changed(newCount)
                    }
                    .presentationDetents([.fraction(0.1)])
            }
        }
    }
}

#Preview {
    VStack{
        GoodItemView(
            count: .constant(0),
            name: "1avrrv",
            price: 0.0,
            pictureName: "pic1"
        ) { v in
            
        }
        
        GoodItemView(
            count: .constant(0),
            name: "arebd",
            price: 0.0,
            pictureName: "pic2"
        ) { v in
            
        }
    }
}
