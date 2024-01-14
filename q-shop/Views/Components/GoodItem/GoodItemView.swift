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
            print("\(content): count new value \(count)")
        }
    }
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
                        QuantityButtonView(count: $count) { value in
                            print("new count for \(content) is \(value)")
                            count = value
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
    GoodItemView(
        count: .constant(0),
        content: "12"
    ) { v in
        
    }.frame(
        width: 200,
        height: 200
    )
}
