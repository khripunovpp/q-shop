//
//  QuantityButton.swift
//  q-shop
//
//  Created by Khripunov Pavel on 30/12/2023.
//

import SwiftUI


struct QActionButtonView: View {
    let imageName: String
    let size: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            Image(systemName: imageName)
                .foregroundColor(.white)
        }
        .frame(width: size, height: size)
        .background(RoundedRectangle(cornerRadius: BASE_RADIUS).fill(BrandColors.main))
    }
}


struct QuantityView: View {
    @Binding var count: Int {
        didSet {
            chnaged(count)
        }
    }
    var compactMode: Bool = false
    var labelStyle: TextStyle = RegularTextSyles
    var max = 99
    var size: CGFloat {
        compactMode ? 30 : 40
    }
    
    let chnaged: (Int) -> Void
    
    func increse() {
        count = count < max ? count + 1 : max
    }
    
    func decrese() {
        count = count <= 0 ? 0 : count - 1
    }
    
    var body: some View {
        HStack {
            QActionButtonView(
                imageName: "minus", size: size) {
                decrese()
            }
            Spacer()
            Text("\(count)").textStyle(labelStyle)
            Spacer()
            QActionButtonView(imageName: "plus", size: size) {
                increse()
            }
        }
    }
}

#Preview {
    QuantityView(count: .constant(0)) { _ in
        
    }
}
