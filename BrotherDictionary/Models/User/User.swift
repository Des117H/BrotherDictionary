//
//  User.swift
//  BrotherDictionary
//
//  Created by Long Truong on 08/09/2022.
//

import Foundation

struct User {
    var email : String
    var lightmode : Bool
    
    init(){
        email = ""
        lightmode = false
    }
    
    init(email: String, lightmode: Bool){
        self.email = email
        self.lightmode = lightmode
    }
}
