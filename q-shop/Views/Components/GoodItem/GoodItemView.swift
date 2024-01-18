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
    @Binding var count: Int {
        didSet {
            model.count = count
            changed(model)
        }
    }
    @State var model: any Good
    var changed: (any Good) -> Void
    
    var body: some View {
        ZStack{
            Group {
                Image(model.pictureName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .allowsHitTesting(false)
                
                Group{
                    VStack {
                        Spacer()
                        VStack(spacing: 0) {
                            VStack{
                                Text(model.name)
                                    .textStyle(GoodNameTextSyles)
                                Text("$" + model.formattedPrice)
                                    .textStyle(GoodNameTextSyles)
                            }
                            .frame(maxWidth: .infinity,  maxHeight: 50)
                            .padding(BASE_PADDING)
                            .background(.ultraThinMaterial.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: BASE_RADIUS))
                            .padding(.bottom, BASE_PADDING)
                            
                            if count > 0 {
                                QuantityButtonView(count: $count) { value in
                                    count = value
                                }
                            } else {
                                BrandButtonView(label: "Add") {
                                    count = 1
                                }
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
                    count: count, model: model) { newGood in
                        changed(newGood)
                    }
                    .presentationDetents([.fraction(0.1)])
            }
        }
    }
}

#Preview {
    VStack{
        GoodItemView(count: .constant(0), model: GoodEntity(name: "RRGer\nRRGer\nRRGer", price: 0.0, pictureName: "pic1"), changed: { _ in })
        
        GoodItemView(count: .constant(0), model: GoodEntity(name: "", price: 0.0), changed: { _ in })
    }
}
