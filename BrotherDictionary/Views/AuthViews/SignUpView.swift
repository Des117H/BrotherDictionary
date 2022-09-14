//
//  SignUpView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
		VStack{
			TextField("Email Address", text: $email)
				.padding()
				
			SecureField("Password", text: $password)
				.padding()
			
			Button(action: {
				guard !email.isEmpty , !password.isEmpty else {
					return
				}
				
				viewModel.SignUp(email: email, password: password)
			}, label: {
				Text("Sign Up")
					.navigationTitle("Sign Up")
					.foregroundColor(Color.black)
					.frame(width: 200, height: 50)
					.background(Color.blue)
			})
			
			Spacer()
		}
		.alert("User already exist!!!", isPresented: $viewModel.isTryIn) {
			Button("OK", role: .cancel) { }
		}
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
