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
    var width: CGFloat
    var colors: [Color] = [.red,.green,.blue,.purple]
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    var innerSpacing: CGFloat
    
    init() {
        self.horizontalSpacing = BASE_PADDING
        self.verticalSpacing = BASE_PADDING
        self.innerSpacing = BASE_PADDING
        self.width = (UIScreen.main.bounds.width - horizontalSpacing - innerSpacing * 2) / 2
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: width), spacing: horizontalSpacing)
                ],
                spacing: verticalSpacing
            ) {
                ForEach(1...8, id: \.self) { n in
                    GoodItem(
                        content: "\(n)"
                    ).frame(width: width, height: width)
                }
            }.padding(innerSpacing)
        }
        
    }
}

#Preview {
    GoodsList()
}
