//
//  WordDetailView.swift
//  BrotherDictionary
//
//  Created by Long Truong on 04/09/2022.
//

import SwiftUI

struct WordDetailView: View {
    
    @State private var newDef = ""
    @State var showEdit = false
    @StateObject var wordViewModel = WordViewModel()
    @State var result = Word()
    @State private var searchText = ""
        
    var body: some View {
        VStack {
            if wordViewModel.singleWord.userEdit == "" {
                Text("Note: \(result.userEdit)")
            } else {
                Text("Note: \(wordViewModel.singleWord.userEdit)")
            }
            Button("Edit") {
                showEdit = true
            }
            .frame(width: 30, height: 30, alignment: .center)
            
            
            if result.word != "" {
                HStack {
                    
                    Text("\(result.word) \(result.pronunciation)")
                        .padding()
                        .foregroundColor(.red)
                    Spacer()
                    Divider()
//                    Spacer()
                    
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
                        
//            Button(action: {
//                wordViewModel.getDetailOneWord(searchWord: result.word)
//            }, label: {
//                Text("get one")
//            })
                        
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
        .onChange(of: showEdit) { _ in
                    wordViewModel.getDetailOneWord(searchWord: result.word)
                }
//        .onAppear(){
//            wordViewModel.getDetailOneWord(searchWord: result.word)
//        }

        .textFieldAlert(isShowing: $showEdit, text: $newDef, wordChosen: result.word)
        .navigationBarItems(
            trailing: HStack {
                
                
            }
        )
        .navigationBarTitle(Text(""), displayMode: .inline)    }
}

struct WordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WordDetailView()
    }
}
