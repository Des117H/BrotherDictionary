//
//  MenuVIew.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 07/09/2022.
//

import SwiftUI
import Firebase

struct MenuView: View {
	@EnvironmentObject var viewModel: AuthModel
    @StateObject var authViewModel = AuthModel()
    
//    @State private var isOn = false
    var body: some View {
		NavigationLink(
		 destination: SearchListView()
		) {
            ZStack{
                // MARK: - DARKMODE BUTTON
                  Button(action: {authViewModel.toggleLightMode()}) {
                      Image(systemName: "lightbulb")
                          Text(" Change Color Mode")
                              .foregroundColor(authViewModel.singleUser.lightmode ? .white : .black)
                      
                          
                  }

            }
			Text("Search word")
				.foregroundColor(.red)
		}
		.buttonStyle(PlainButtonStyle())
        .onAppear(){
            authViewModel.getOne()
        }
		
		Button(action: {
			viewModel.SignOut()
		}, label: {
			Text("Sign Out")
				.foregroundColor(Color.black)
				.frame(width: 200, height: 50)
				.background(Color.blue)
		})        .preferredColorScheme(authViewModel.singleUser.lightmode ? .light : .dark)

    }
}
