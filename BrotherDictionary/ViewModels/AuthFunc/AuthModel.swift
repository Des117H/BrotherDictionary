//
//  AppViewModel.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import Foundation
import Firebase
import FirebaseAuth



class AuthModel: ObservableObject {
    let auth = Auth.auth()
    let firestore = Firestore.firestore()
    
    @Published var signedIn = false
    
    @Published var singleUser = User.init()
    
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
        
//        let userEmail = auth.currentUser?.email
//        let userId = auth.currentUser?.uid
        let userData : [String: Any]  = [
            "Email": email,
            "LightMode": false
        ]
        firestore.collection("User").document(email.lowercased()).setData(userData)
        
    }
    
    func getOne (){
        let user = auth.currentUser?.email
        var email: String = ""
        var lightmode: Bool = false

        firestore.collection("User").document((user?.lowercased())!).getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                email = docData!["Email"] as? String ?? ""
                lightmode = docData!["LightMode"] as? Bool ?? false
                
                self.singleUser = User(email: email, lightmode: lightmode)
                
            } else {
                print("User is not exist")
            }
        }
    }
    
    func toggleLightMode(){
        let changeLightMode: [String: Any] = [
            "LightMode": !self.singleUser.lightmode
        ]
        self.getOne()
        let documentID = firestore.collection("User").document((self.singleUser.email.lowercased())).documentID
        if documentID == (auth.currentUser?.email)! {
            do {
                try firestore.collection("User").document(documentID).updateData(changeLightMode)
                  }
                  catch {
                    print(error)
                  }
        }
    }
    
    func SignOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
    

    
}
