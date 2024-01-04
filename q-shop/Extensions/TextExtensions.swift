//
//  TextExtensions.swift
//  q-shop
//
//  Created by Khripunov Pavel on 04/01/2024.
//

import SwiftUI

struct TextStyle {
    var color: Color = .black
    var size: CGFloat = 16
    
    mutating func clone(_ styles: TextStyle? = nil) -> TextStyle {
        return TextStyle(
            color: styles?.color ?? color,
            size: styles?.size ?? size 
        )
    }
}

struct TextStyleModifier: ViewModifier {
    let styles: TextStyle
    func body(content: Content) -> some View {
        content
            .foregroundColor(styles.color)
            .font(.system(size: styles.size))
    }
}

extension Text {
    func textStyle(_ styles: TextStyle) -> some View {
        ModifiedContent(content: self, modifier: TextStyleModifier(styles: styles))
    }
}
