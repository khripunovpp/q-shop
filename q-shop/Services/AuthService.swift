//
//  AuthService.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService: ObservableObject {
    static let shared = AuthService()
    @Published var user: FirebaseAuth.User?
    private init(){
        self.user = Auth.auth().currentUser
        Auth.auth().addIDTokenDidChangeListener(){ [weak self] auth,user in
            print("user changed \(user?.uid)")
            self?.user = user
        }
    }
    public var isSignnedIn: Bool {
        return self.user != nil
    }
    
    public var currentUser: UserInfo? {
        return self.user
    }
    
    public var uuid: String {
        return self.currentUser?.uid ?? ""
    }
    
    func createUser(
        name: String,
        email: String,
        password: String,
        _ complete: @escaping (_ result: AuthDataResult?, _ error: Error?) -> Void
    ) {
        Auth.auth().createUser(withEmail: email, password: password) { result,error in
            complete(result,error)
        
            if let userId = result?.user.uid {
                self.user = Auth.auth().currentUser
                self.setUser(id:userId,name: name,email: email)
            }
        }
    }
    
    
    private func setUser(
        id: String,
        name: String,
        email: String
    ){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(AuthService.shared.uuid)
            .setData([
                "id": id,
                "email": email,
                "name": name,
                "created": Date().timeIntervalSince1970,
            ])
        
    }
    
    func logout(){
        do {
            try Auth.auth().signOut()
            
            self.user = nil
            
            print("after logout \( Auth.auth().currentUser?.uid ?? "")")
        } catch {
            
        }
    }
}
