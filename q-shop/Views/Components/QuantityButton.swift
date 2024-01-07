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
    
    let chnaged: (Int) -> Void
    
    
    var body: some View {
        HStack {
            Button{
                counter -= 1
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(.black)
            }
            Spacer()
            Text("\(counter)")
            Spacer()
            Button{
                    counter += 1
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
