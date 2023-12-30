//
//  GoodsList.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI

struct GoodsList: View {
    var items: [String] = [
        "43fqred",
        "egravf"
    ]
    var width = UIScreen.main.bounds.width / 2
    var colors: [Color] = [.red,.green,.blue,.purple]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: width),spacing: 0)], spacing: 0) {
                ForEach(1...8, id: \.self) { n in
                    GoodItem(
                        width: width,
                        height: width,
                        content: "\(n)"
                    ).frame(width: width, height: width)
                }
            }
        }
        
    }
}

#Preview {
    GoodsList()
}
