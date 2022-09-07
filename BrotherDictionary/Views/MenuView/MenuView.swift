//
//  MenuVIew.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 07/09/2022.
//

import SwiftUI

struct MenuView: View {
	@EnvironmentObject var viewModel: AuthModel
	
    var body: some View {
		NavigationLink(
		 destination: SearchListView()
		) {
			Text("Search word")
				.foregroundColor(.red)
		}
		.buttonStyle(PlainButtonStyle())
		
		Button(action: {
			viewModel.SignOut()
		}, label: {
			Text("Sign Out")
				.foregroundColor(Color.black)
				.frame(width: 200, height: 50)
				.background(Color.blue)
		})
    }
}
