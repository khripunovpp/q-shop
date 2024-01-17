//
//  GoodItem.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI
import Resolver

struct GoodItemView: View {
    @State var sheet = false
    @Binding var count: Int {
        didSet {
            print("GoodItemView: \(content): count new value \(count)")
        }
    }
    @State var content: String
    var changed: (Int) -> Void
    var body: some View {
        ZStack{
            Group {
                Image("pic\(content)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
                    .allowsHitTesting(false)
                
                Group{
                    VStack {
                        Spacer()
                        VStack{
                            Text(content)
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
                    count: count, name: $content, description: $content) { newCount in
                        changed(newCount)
                    }
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
}

#Preview {
    VStack{
        GoodItemView(
            count: .constant(0),
            content: "1"
        ) { v in
            
        }.frame(
            width: 200,
            height: 200
        )
        GoodItemView(
            count: .constant(0),
            content: "2"
        ) { v in
            
        }.frame(
            width: 200,
            height: 200
        )
    }
}
