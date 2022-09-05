//
//  AppDelegate.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import Foundation
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        FirebaseApp.configure()
        
        return true
    }
}
