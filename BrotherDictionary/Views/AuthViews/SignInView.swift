//
//  SignInView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
		VStack{
			VStack{
				TextField("Email Address", text: $email)
					.padding()
					
				SecureField("Password", text: $password)
					.padding()
				
				Button(action: {
					guard !email.isEmpty , !password.isEmpty else {
						return
					}
					
					viewModel.SignIn(email: email, password: password)
				}, label: {
					Text("Sign in")
						.navigationTitle("Sign In")
						.foregroundColor(Color.black)
						.frame(width: 200, height: 50)
						.background(Color.blue)
				})
				
				NavigationLink("Create Account", destination: SignUpView())
			}
			.padding()
			
			Spacer()
		}
		.alert("Wrong Email or Password!!!", isPresented: $viewModel.isTryIn) {
			Button("OK", role: .cancel) { }
		}
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
