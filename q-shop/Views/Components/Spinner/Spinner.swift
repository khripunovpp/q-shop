//
//  Spinner.swift
//  q-shop
//
//  Created by Khripunov Pavel on 19/01/2024.
//

import SwiftUI

struct Spinner: View {
    @Binding var showSpinner: Bool
    @State private var degree: Int = 270
    @State private var spinnerLength: CGFloat = 0.6
    
    var body: some View {
        if showSpinner {
            ZStack {
                BrandColors.main.opacity(0.5).ignoresSafeArea()
                ProgressView()
                     .progressViewStyle(CircularProgressViewStyle(tint: .white))
                     .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
                     .onAppear {
                     }
                }
            }
    }
}

#Preview {
    Spinner(showSpinner: .constant(true))
}
