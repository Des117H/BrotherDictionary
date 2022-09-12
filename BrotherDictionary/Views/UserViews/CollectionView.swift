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
    
    func removeRows(at offsets: IndexSet, word: Word) {
        wordViewModel.listColWord.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
            VStack{
                List{
                    ForEach(wordViewModel.listColWord) {
                        word in
                        HStack {
                            NavigationLink{
                                WordDetailView(result: word)
                            } label: {
                                HStack{
                                    Text(word.word)
                                }
                            }
                            
//                            Button{
//                                wordViewModel.delete(wordChosen: word.word)
//                            } label: {
//                                Image(systemName: "minus.circle")
//                                    .foregroundColor(.red)
//
//                            }
                        }
                    }
                }

//                    .navigationTitle("\(authViewModel.singleUser.email) collection")
                    .navigationBarItems(trailing: EditButton())
                
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
