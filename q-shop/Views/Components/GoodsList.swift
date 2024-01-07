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
    var width: CGFloat
    var colors: [Color] = [.red,.green,.blue,.purple]
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    var innerSpacing: CGFloat
    var addedHadler: (String, Int) -> Void
    
    init(
        _ addedHadler: @escaping (String, Int) -> Void = {_,_ in}
    ) {
        self.horizontalSpacing = BASE_PADDING
        self.verticalSpacing = BASE_PADDING
        self.innerSpacing = BASE_PADDING
        self.width = (UIScreen.main.bounds.width - horizontalSpacing - innerSpacing * 2) / 2
        self.addedHadler = addedHadler
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
                    ) { v in
                        addedHadler("\(n)",v)
                    }.frame(width: width, height: width)
                }
            }.padding(innerSpacing)
        }
        
    }
}

#Preview {
    GoodsList()
}
