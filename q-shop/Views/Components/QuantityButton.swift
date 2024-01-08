//
//  QuantityButton.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI

struct QuantityButton: View {
    @State var counter = 0 {
        didSet {
            chnaged(counter)
        }
    }
    var max = 3
    
    let chnaged: (Int) -> Void
    
    func increse() {
        counter = counter < max ? counter + 1 : max
    }
    
    func decrese() {
        counter = counter <= 0 ? 0 : counter - 1
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
            Text("\(counter)")
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
    QuantityButton() { _ in
        
    }
}
