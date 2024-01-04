//
//  ShowcaseScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct ShowcaseScreenView: View {
    @State var sheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView()
            FiltersBar()
            GoodsList().onTapGesture {
                print("tap")
                sheet = true
            }
            Spacer()
        }.sheet(isPresented: $sheet) {
            VStack(spacing: 0){
                Spacer()
                SingleGoodDetailsScreenView().presentationDetents([.fraction(0.3)])
            }
        }
    }
}

#Preview {
    ShowcaseScreenView()
}
