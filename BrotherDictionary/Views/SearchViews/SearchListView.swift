//
//  SearchView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI

struct SearchListView: View {
    @State private var searchText = "welcome"
    @StateObject var wordViewModel = WordViewModel()
	@State var showEdit = false
	@State var editedDef = ""
	@State private var newDef = ""


    var body: some View {
		let result = ConvertJSONtoWord(
			word:
				decoceJsonFileToStruct(
					wordSearch:
						searchText
						.replacingOccurrences(of: " ", with: "_")))
        
//        NavigationView {
//            VStack {
//                VStack {
//                    Text(result.word)
//                        .font(.headline)
//                    Text(result.pronunciation)
//                        .font(.subheadline)
//                }
//                .frame(width: UIScreen.screenWidth, height: 100, alignment: .center)
//                Button(action: {
//                    wordViewModel.addColWord(colWord: result)
//                }) {
//                  Text("Plus")
//                }
//
//                List {
//                    ForEach (result.wordForms, id: \.self) { form in
//                        Section (header: Text(form)) {
//                            ForEach (result.definitions[form]!, id: \.self) { def in
//                                Text(def)
//                            }
//                        }
//                    }
//                }
//                .listStyle(GroupedListStyle())
//            }
        
			VStack {
				TextField("Enter word", text: $searchText)
				.textInputAutocapitalization(.never)
				.padding()
				
				
				Divider()
				
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
//            .textFieldAlert(isShowing: $showEdit, text: $newDef, isDark: )
			.navigationBarItems(
				leading:
					Button("Edit") {
						showEdit = true
					}
				,
				trailing:
					Button(action: {
						wordViewModel.deleteWord(wordChosen: searchText)
					}, label: {
						Text("Delete")
					})
				)
//            VStack {
//                Text(wordViewModel.singleWord.word)
//                Spacer()
//                Button(action: {
//                    wordViewModel.deleteWord(wordChosen: "welcome")
//                }) {
//                    Text("Delete")
//                }
//            }
//            .onAppear(){
//                wordViewModel.getDetailOneWord(searchWord: "welcome")
//            }
//        }
//        .searchable(text: $searchText)
//            .onChange(of: searchText) {
//                value in
//                async {
//                    if !value.isEmpty {
//                        await result
//                    } else {
//                        await result
//                    }
//                }
//            }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
