//
//  UserSettingView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI

struct UserSettingView: View {
    @EnvironmentObject var viewModel: AuthModel
    @StateObject var authViewModel = AuthModel()
	@State var dark: Bool = false

    var body: some View {
        VStack{
			Button(action: {
				authViewModel.toggleLightMode()
				authViewModel.getOne()
				dark = !dark
			}) {
				Image(systemName: "lightbulb")
				Text(" Change Color Mode")
					.foregroundColor(!authViewModel.singleUser.lightmode ? .white : .black)
			}
			Button(action: {
				viewModel.SignOut()
			},label: {
				Text("Sign Out")
			})
		}
		.preferredColorScheme(authViewModel.singleUser.lightmode ? .light : .dark)
        .onAppear(){
            authViewModel.getOne()
        }
		.onChange(of: authViewModel.singleUser.lightmode, perform: { _ in
			authViewModel.getOne()
		})

    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}
