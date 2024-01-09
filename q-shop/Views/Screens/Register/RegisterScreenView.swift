//
//  RegisterScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct RegisterScreenView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                RegisterFormView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterScreenView()
}
