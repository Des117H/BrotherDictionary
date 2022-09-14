//
//  TextFieldAlert.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 07/09/2022.
// https://stackoverflow.com/a/56732240

import Foundation
import SwiftUI

extension View {
	func textFieldAlert(isShowing: Binding<Bool>, text: Binding<String>,
                        wordChosen: String, isDark: Bool) -> some View {
		TextFieldAlert(isShowing: isShowing, result: text,
					   wordChosen: wordChosen, presenting: self, isDark: isDark)
	}
}

struct TextFieldAlert<Presenting>: View where Presenting: View {
	@Binding var isShowing: Bool
	@Binding var result: String
	
    var wordChosen: String
	let presenting: Presenting
	var isDark: Bool
	
    @StateObject private var wordViewModel = WordViewModel()
    
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
							wordViewModel.updateWord(userNote: result, wordChosen: wordChosen)
							withAnimation {
								self.isShowing.toggle()
                            }
                            }, label: {
                                Text("Save")
							}
                        )
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.isShowing.toggle()
                            }
                            }, label: {
                                Text("Cancel")
							}
                        )
					}
                    .onSubmit{
                        wordViewModel.getDetailOneWord(searchWord: wordChosen)
                    }
				}
				.padding()
				.background(isDark ? Color.white : Color.black)
				.preferredColorScheme(isDark ? .light : .dark)
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
