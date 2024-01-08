//
//  GoodsList.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI
import Resolver

struct GoodsList: View {
    var items: [String] = [
        "43fqred",
        "egravf"
    ]
    var colors: [Color] = [.red,.green,.blue,.purple]
    var verticalSpacing: CGFloat = BASE_PADDING
    var addedHadler: (String, Int) -> Void
    
    var body: some View {
        ScrollView() {
            VStack(spacing: verticalSpacing) {
                ForEach(1...4, id: \.self) { n in
                    GoodItem(
                        content: "\(n)"
                    ) { v in
                        addedHadler("\(n)",v)
                    }
                }
            }
        }
        
    }
}

#Preview {
    GoodsList() { _,_ in
        
    }
}
