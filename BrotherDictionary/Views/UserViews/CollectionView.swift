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
        Text("\(authViewModel.singleUser.email) collection")
        List {
            ForEach (wordViewModel.listColWord) { word in
                NavigationLink {
                    WordDetailView(result: word)
                } label: {
                    Section(header: Text(word.word)){
                    }
                }
                Button(action: {
                    wordViewModel.deleteWord(wordChosen: word.word)
                }, label: {
                    Text("Delete")
                })
                .frame(width: 50, height: 30, alignment: .center)

            }
        }
        .onAppear(){
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
