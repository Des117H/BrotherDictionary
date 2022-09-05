//
//  SearchView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI

struct SearchListView: View {
    @State private var searchText: String = "welcome"
    
    var body: some View {
        let result = ConvertJSONtoWord(word: decoceJsonFileToStruct(wordSearch: searchText))
        NavigationView {
            VStack {
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
        .searchable(text: $searchText)
            .onChange(of: searchText) {
                value in
                async {
                    if !value.isEmpty {
                        await result
                    } else {
                        await result
                    }
                }
            }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
