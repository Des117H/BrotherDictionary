//
//  SearchView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI

struct SearchListView: View {
    @State private var searchText = ""
    @StateObject var wordViewModel = WordViewModel()
	@State var showEdit = false
	@State var editedDef = ""
	@State private var newDef = ""
	@State var result = Word()
    var body: some View {
		VStack {
			Divider()
			HStack {
				Image("SearchGlass")
					.frame(width: 25, height: 25, alignment: .center)
				TextField("Enter word", text: $searchText)
				.textInputAutocapitalization(.never)
				.padding()
				.onSubmit({
					result = ConvertJSONtoWord(
						word:
							decoceJsonFileToStruct(
								wordSearch:
									searchText
									.replacingOccurrences(of: " ", with: "%20")
							)
					)
				})
			}
			
			Divider()
			if result.word != "" {
				HStack {
					Text("Pronunciation: \(result.pronunciation)")
						.padding()
						.foregroundColor(.red)
					Spacer()
					Divider()
					Spacer()
					
					Button(action: {
						if let url = URL(string: result.audioUrl) {
							Player.share.play(url: url)
						}
					}, label: {
						Image("Sound")
							.frame(width: 25, height: 25, alignment: .center)
					})
				}
				.frame(height: 30, alignment: .center)
			}
			
			List {
				ForEach (result.wordForms, id: \.self) { form in
					Section (header: Text(form)) {
						ForEach (result.definitions[form]!, id: \.self) { def in
							Text(def)
						}
					}
				}
			}
			Spacer()
		}
//		.textFieldAlert(isShowing: $showEdit, text: $newDef)
		.navigationBarItems(
			trailing: HStack {
				Button(action: {
                    wordViewModel.addColWord(colWord: result)
				}, label: {
					Text("Add")
				})
				.frame(width: 30, height: 30, alignment: .center)
            }
		)
		.navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
