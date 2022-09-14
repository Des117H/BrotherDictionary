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
    
    var body: some View {
		VStack {
			Spacer()
			NavigationLink( destination: SearchListView() ) {
				Text("Search word")
					.foregroundColor(Color.black)
					.frame(width: 200, height: 50)
					.background(Color.blue)
			}
			.buttonStyle(PlainButtonStyle())

			NavigationLink( destination: CollectionView() ) {
				Text("User collection")
					.foregroundColor(Color.black)
					.frame(width: 200, height: 50)
					.background(Color.blue)
			}
			.buttonStyle(PlainButtonStyle())

			Spacer()
		}
		.preferredColorScheme(authViewModel.singleUser.lightmode ? .light : .dark)
		.onAppear(){
			authViewModel.getOne()
		}
		.navigationBarItems(leading:
			Button(action: {
				authViewModel.toggleLightMode()
				authViewModel.getOne()
			}) {
				Image(systemName: "lightbulb")
				Text(authViewModel.singleUser.lightmode ? "Dark Mode" : "Light Mode")
					.foregroundColor(!authViewModel.singleUser.lightmode ? .white : .black)
			}
		, trailing:
			Button(action: {
				viewModel.SignOut()
			},label: {
				Text("Sign Out")
			})
		)
	}
}
