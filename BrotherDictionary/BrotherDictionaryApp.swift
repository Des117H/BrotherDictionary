/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tu Gia Dinh
  ID: 3891542
  Created  date: 04/09/2022
  Last modified:
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
