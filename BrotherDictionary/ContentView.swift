//
//  ContentView.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 04/09/2022.
//

//import Collections
import SwiftUI


struct ContentView: View {
	let result = ConvertJSONtoWord(word: decoceJsonFileToStruct(wordSearch: "get"))
//	let OrderedDefinition = OrderedDictionary(uniqueKeys:
//												result.definitions.keys,
//											  values:
//												result.definitions.values)
	var body: some View {
		List {
			ForEach (result.wordForms, id: \.self) { form in
				Text(form)
					.font(.headline)
				ForEach (result.definitions[form]!, id: \.self) { def in
					Text(def)
						.font(.title)
				}
			}
		}
	}
}
