//
//  ScreenHeaderView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 12/01/2024.
//

import SwiftUI

struct ScreenHeaderView: View {
    let title: String
    var body: some View {
        Text(title)
            .textStyle(TitleLvl1)
            .padding(.bottom, BASE_PADDING)
    }
}

#Preview {
    ScreenHeaderView(title: "Page title")
}
