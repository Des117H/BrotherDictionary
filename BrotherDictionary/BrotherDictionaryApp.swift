//
//  BrotherDictionaryApp.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 04/09/2022.
//

import SwiftUI
import Firebase

@main
struct BrotherDictionaryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
           let viewModel = AuthModel()
           ContentView()
                .environmentObject(viewModel)
        }
    }
}
