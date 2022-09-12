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

    var body: some View {
        VStack{
              Button(action: {authViewModel.toggleLightMode()}) {
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
        .onAppear(){
            authViewModel.getOne()
        }
                .preferredColorScheme(authViewModel.singleUser.lightmode ? .light : .dark)

    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}
