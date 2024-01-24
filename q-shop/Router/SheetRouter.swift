//
//  SheetRouter.swift
//  q-shop
//
//  Created by Khripunov Pavel on 24/01/2024.
//

import Foundation

enum SheetName: String, CaseIterable, RawRepresentable {
    case Order
}

final class SheetRouter: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var sheetName: SheetName?
    
    func to(
        _ name: SheetName
    ) {
        sheetName = name
        isPresented = true
    }
    
    func hide() {
        isPresented = false
    }
}
