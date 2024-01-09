//
//  LoginScreenView.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import SwiftUI

struct LoginScreenView: View {
    var body: some View {
        NavigationView{
            VStack{
                LoginFormView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginScreenView()
}
