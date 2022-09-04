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
	let result = ConvertJSONtoWord(word: decoceJsonFileToStruct(wordSearch: "get"))
	
	var body: some View {
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
