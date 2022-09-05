//
//  ContentView.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 04/09/2022.
//


import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn {
                VStack{
                    SearchListView()
                    Button(action: {
                        viewModel.SignOut()
                    }, label: {
                        Text("Sign Out")
                            .foregroundColor(Color.black)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                    })
                }

            } else {
                SignInView()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
