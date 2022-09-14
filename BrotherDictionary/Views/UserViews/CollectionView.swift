//
//  CollectionView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI

struct CollectionView: View {
    @StateObject private var wordViewModel = WordViewModel()
    @StateObject private var authViewModel = AuthModel()
    
    var body: some View {
		VStack{
			List{
				ForEach (wordViewModel.listColWord) { word in
					HStack {
						NavigationLink {
							WordDetailView(result: word)
						} label: {
							Text(word.word)
						}
					}
					.swipeActions(edge: .trailing) {
						Button{
							wordViewModel.delete(wordChosen: word.word)
						} label: {
							Label("Delete", systemImage: "trash")
						}
						.tint(.red)
					}
				}
			}
			.navigationBarTitle("Word Collection", displayMode: .inline)
			.listStyle(InsetListStyle())
		}
        .onAppear() {
			wordViewModel.getListColWord()
            authViewModel.getOne()
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
