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
                .font(.system(size: 18))
                .clipShape(RoundedRectangle(cornerRadius: BASE_RADIUS))
        }
        .background(in: Rectangle())
        .backgroundStyle(.white.opacity(0))
    }
}

#Preview {
    SearchBarView()
}
