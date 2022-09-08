//
//  WordViewModel.swift
//  BrotherDictionary
//
//  Created by Nguyen Hoang Minh Nhat on 06/09/2022.
//

import Foundation
import Combine
import Firebase
import CoreAudio

class WordViewModel: ObservableObject {
    private let db = Firestore.firestore()
    @Published var listColWord = [Word]()
    @Published var singleWord = Word.init()
    func addColWord(colWord: Word) {
        let docData: [String: Any] = [
            "word": colWord.word,
            "pronunciation": colWord.pronunciation,
            "definitions": colWord.definitions,
            "audioUrl": colWord.audioUrl,
			"userEdit": colWord.userEdit,
            "wordForms": colWord.wordForms,
            "dateAdded": Timestamp(date: Date()),
        ]

        let docRef = db.collection("collections").document(colWord.word)

        docRef.setData(docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func getListColWord() {
        let docRef = db.collection("collections")
        
        docRef.addSnapshotListener{
            (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.listColWord = documents.map{
                (queryDocumentSnapshot) -> Word in
                let data = queryDocumentSnapshot.data()
                
                let word = data["word"] as? String ?? ""
                let pronunciation = data["pronunciation"] as? String ?? ""
                let definition = data["definition"] as? [String : [String]] ?? ["": [""]]
                let audioUrl = data["audioUrl"] as? String ?? ""
                let wordForms = data["wordForms"] as? [String] ?? []
                
                return Word(word: word, pronunciation: pronunciation, definiton: definition, audioUrl: audioUrl, wordForms: wordForms)

            }
            
        }
    }
    
    func getDetailOneWord(searchWord: String) {
        let documentId = db.collection("collections").document(searchWord).documentID
        let docRef = db.collection("collections").document(searchWord)
        
        var word: String = ""
        var pronunciation: String = ""
        var definitions: [String : [String]] = ["": [""]]
        var audioUrl: String = ""
        var wordForms: [String] = [""]

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                word = docData!["word"] as? String ?? ""
                pronunciation = docData!["pronunciation"] as? String ?? ""
                definitions = docData!["definitions"] as? [String: [String]] ?? ["":[""]]
                audioUrl = docData!["audioUrl"] as? String ?? ""
                wordForms = docData!["wordForms"] as? [String] ?? [""]
                self.singleWord = Word(word: word, pronunciation: pronunciation, definiton: definitions, audioUrl: audioUrl, wordForms: wordForms)

            } else {
                print("Document does not exist")
            }
        }
    }
    
    func updateWord(userNote: String, wordChosen: String) {
        let updateUserNote: [String: Any] = [
            "userEdit": userNote,
            "dateAdded": Timestamp(date: Date()),
        ]
        let documentID = db.collection("collections").document(wordChosen).documentID
        if documentID == wordChosen {
            do {
                try db.collection("collections").document(documentID).updateData(updateUserNote)
                  }
                  catch {
                    print(error)
                  }
        }
    }
    
    func deleteWord(wordChosen: String) {
        let documentID = db.collection("collections").document(wordChosen).documentID
        if documentID == wordChosen {
            do {
                try db.collection("collections").document(documentID).delete()
                  }
                  catch {
                    print(error)
                  }
        }
    }

}
