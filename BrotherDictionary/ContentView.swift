/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tu Gia Dinh
  ID: 3891542
  Created  date: 04/09/2022
  Last modified:
  Acknowledgement:
 https://www.hackingwithswift.com/quick-start/swiftui/building-a-menu-using-list
*/
import SwiftUI


struct ContentView: View {
	let result = ConvertJSONtoWord(word: decoceJsonFileToStruct(wordSearch: "ssss"))
	
	var body: some View {
		VStack {
			Text("1")
			VStack {
				Text(result.word)
					.font(.headline)
				Text(result.pronunciation)
					.font(.subheadline)
			}
			.frame(width: UIScreen.screenWidth, height: 100, alignment: .center)
			
			List {
				ForEach (result.wordForms, id: \.self) { form in
					Section (header: Text(form)) {
						ForEach (result.definitions[form]!, id: \.self) { def in
							Text(def)
						}
					}
				}
			}
			.listStyle(GroupedListStyle())
		}
	}
}
