//
//  AppViewModel.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import Foundation
import FirebaseAuth



class AuthModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    
    func SignIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {
            [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn  = true
            }
        }
    }
    
    func SignUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password){
            [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }


        }
    }
    
    func SignOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
    
}
