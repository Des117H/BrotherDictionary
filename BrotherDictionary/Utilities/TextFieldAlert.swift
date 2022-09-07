//
//  TextFieldAlert.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 07/09/2022.
// https://stackoverflow.com/a/56732240

import Foundation
import SwiftUI

extension View {

	func textFieldAlert(isShowing: Binding<Bool>,
						text: Binding<String>) -> some View {
		TextFieldAlert(isShowing: isShowing,
					   result: text,
					   presenting: self)
	}

}

struct TextFieldAlert<Presenting>: View where Presenting: View {

	@Binding var isShowing: Bool
	@Binding var result: String
	let presenting: Presenting

	var body: some View {
		GeometryReader { (deviceSize: GeometryProxy) in
			ZStack {
				self.presenting
					.disabled(isShowing)
				VStack {
					Text("New definition")
					TextField("Enter your new definition", text: self.$result)
					Divider()
					HStack {
						Button(action: {
							withAnimation {
								self.isShowing.toggle()
							}
						}) {
							Text("Dismiss")
						}
					}
				}
				.padding()
				.background(Color.white)
				.frame(
					width: deviceSize.size.width*0.7,
					height: deviceSize.size.height*0.7
				)
				.shadow(radius: 1)
				.opacity(self.isShowing ? 1 : 0)
			}
		}
	}

}
