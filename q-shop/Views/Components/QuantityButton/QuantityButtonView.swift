//
//  QuantityButton.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI


struct QuantityButtonView: View {
    @Binding var count: Int {
        didSet {
            chnaged(count)
        }
    }
    var max = 3
    
    let chnaged: (Int) -> Void
    
    func increse() {
        count = count < max ? count + 1 : max
    }
    
    func decrese() {
        count = count <= 0 ? 0 : count - 1
    }
    
    var body: some View {
        HStack {
            Button{
                decrese()
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(.black)
            }
            Spacer()
            Text("\(count)")
            Spacer()
            Button{
                increse()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    QuantityButtonView(count: .constant(0)) { _ in
        
    }
}
