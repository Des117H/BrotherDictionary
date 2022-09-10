//
//  ModalTextInput.swift
//  BrotherDictionary
//
//  Created by Nguyen Hoang Minh Nhat on 10/09/2022.
//

import SwiftUI

struct ModalTextInput: View {
    @Binding var newDef: String
    @Binding var isShowing: Bool
    @State var wordChosen: String
    @StateObject private var wordViewModel = WordViewModel()
    
    var body: some View {
        ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                    VStack {
                        Text("Custom Alert")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        Divider()
                        
                        TextField("Enter text", text: $newDef)
                            .padding(5)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                        
                        Divider()
                        
                        HStack {
                            Button("Save") {
                                self.wordViewModel.updateWord(userNote: newDef, wordChosen: wordChosen)
                                self.isShowing.toggle()
                            }

                            Button("Dismiss") {
                                self.isShowing.toggle()
                            }
                        }
                        .padding(30)
                        .padding(.horizontal, 40)
                    }
                    .onSubmit{
                        self.wordViewModel.getDetailOneWord(searchWord: wordChosen)
                    }
                }
                .frame(width: 300, height: 200)    }
}

//struct ModalTextInput_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalTextInput()
//    }
//}
