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
		ZStack {
			if authViewModel.singleUser.lightmode {
				Image("white")
			} else {
				Image("black")
			}
			VStack{
				Text("1")
			}
			.onAppear() {
				authViewModel.getOne()
			}
			.onChange(of: dark, perform: { _ in
				authViewModel.getOne()
				print(dark)
			})
			.preferredColorScheme(authViewModel.singleUser.lightmode ? .light : .dark)
		}

    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}
