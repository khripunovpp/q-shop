//
//  SearchBarView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 29/12/2023.
//

import SwiftUI

struct SearchBarView: View {
    @State var query = ""
    var body: some View {
        HStack{
            TextField("", text: $query)
                .padding(EdgeInsets(
                    top: 5,
                    leading: 15,
                    bottom: 5,
                    trailing: 15
                ))
                .background(in: Rectangle())
                .backgroundStyle(.white)
                .font(.system(size: 25))
                .foregroundColor(BrandColors.main)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .padding(EdgeInsets(
            top: BASE_PADDING,
            leading: BASE_PADDING,
            bottom: BASE_PADDING,
            trailing: BASE_PADDING
        ))
        .background(in: Rectangle())
        .backgroundStyle(BrandColors.main)
    }
}

#Preview {
    SearchBarView()
}
