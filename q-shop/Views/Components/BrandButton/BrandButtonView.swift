//
//  Button.swift
//  my-todo-list
//
//  Created by Khripunov Pavel on 19/12/2023.
//

import SwiftUI

struct ButtonStyle {
    let radius: CGFloat
    let fontSize: CGFloat
    let padding: CGFloat
}

enum ButtonSize {
    case small, big
}

let ButtonSizesMap: [ButtonSize:ButtonStyle] = [
    ButtonSize.big: ButtonStyle(radius: 20, fontSize: 25, padding: 30),
    ButtonSize.small: ButtonStyle(radius: 15, fontSize: 20, padding: 20),
]

struct BrandButtonView: View {
    let label: String
    var type: ButtonSize = .small
    var size: CGFloat?
    let action: () -> Void
    var height: CGFloat {
        return (ButtonSizesMap[type]?.fontSize ?? 25) + (ButtonSizesMap[type]?.padding ?? 0)
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: ButtonSizesMap[type]?.radius ?? 25)
                    .foregroundColor(colorScheme == .dark ? .white : BrandColors.main)
                    .frame(height: height)
                
                Text(label)
                    .font(.system(size: ButtonSizesMap[type]?.fontSize ?? 25))
                    .foregroundStyle(colorScheme == .dark ? BrandColors.main : .white)
            }
        }
    }
}

#Preview {
    VStack{
        BrandButtonView(label: "Small") {
            
        }
        BrandButtonView(label: "Big",type: .big) {
            
        }
    }.padding()
}
