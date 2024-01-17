//
//  AuthService.swift
//  q-shop
//
//  Created by Khripunov Pavel on 28/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import RxSwift

class AuthService {
    typealias FUser = FirebaseAuth.User
    
    private var userSubject = BehaviorSubject<FUser?>(value: nil)
    
    init() {
        self.userSubject.onNext(Auth.auth().currentUser)
        Auth.auth().addIDTokenDidChangeListener() { [weak self] auth, user in
            print("user changed \(user?.uid ?? "")")
            Thread.printCurrent()
            self?.userSubject.onNext(user)
        }
    }
    
    public var isSignnedIn: Bool {
        return self.currentUser != nil
    }
    
    public var currentUser: FUser? {
        return try? self.userSubject.value()
    }
    
    public var currentUser$: Observable<FUser?> {
        return self.userSubject.asObservable()
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
            
            guard let userId = result?.user.uid else {
                return
            }
            self.userSubject.onNext(Auth.auth().currentUser)
            self.setUser(id: userId, name: name,email: email)
        }
    }
    
    func createUserAsync(
        name: String,
        email: String,
        password: String
    ) async -> FUser {
        await withCheckedContinuation{ continuation in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    continuation.resume(throwing: error as! Never)
                    return
                }
                self.userSubject.onNext(Auth.auth().currentUser)
                self.setUser(id: result?.user.uid ?? "", name: name,email: email)
                continuation.resume(returning: result as! FUser)
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
            .document(uuid)
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

            self.userSubject.onNext(nil)
        } catch {
            
        }
    }
}
