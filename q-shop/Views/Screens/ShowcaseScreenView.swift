//
//  ShowcaseScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct ShowcaseScreenView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SearchBarView()
            FiltersBar()
            GoodsList()
            Spacer()
        }
    }
}

#Preview {
    ShowcaseScreenView()
}
