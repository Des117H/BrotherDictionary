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
import FirebaseAuth

class WordViewModel: ObservableObject {
    private let db = Firestore.firestore()
    let authEmail = (Auth.auth().currentUser?.email)!
    let userCollection = "User"
    let userCollectionWords = "words"
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

        let docRef = db.collection(userCollection).document(authEmail).collection(userCollectionWords).document(colWord.word)

        docRef.setData(docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func getListColWord() {
        let docRef = db.collection(userCollection).document(authEmail).collection(userCollectionWords)
        
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
                let definition = data["definitions"] as? [String : [String]] ?? ["": [""]]
                let audioUrl = data["audioUrl"] as? String ?? ""
                let wordForms = data["wordForms"] as? [String] ?? []
                let userEdit = data["userEdit"] as? String ?? ""
                
                return Word(word: word, pronunciation: pronunciation, definiton: definition, audioUrl: audioUrl, wordForms: wordForms, userEdit: userEdit)

            }
            
        }
    }
    
    func getDetailOneWord(searchWord: String) {
        let docRef = db.collection(userCollection).document(authEmail).collection(userCollectionWords).document(searchWord)
        
        var word: String = ""
        var pronunciation: String = ""
        var definitions: [String : [String]] = ["": [""]]
        var audioUrl: String = ""
        var wordForms: [String] = [""]
        var userEdit: String = ""

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                word = docData!["word"] as? String ?? ""
                pronunciation = docData!["pronunciation"] as? String ?? ""
                definitions = docData!["definitions"] as? [String: [String]] ?? ["":[""]]
                audioUrl = docData!["audioUrl"] as? String ?? ""
                wordForms = docData!["wordForms"] as? [String] ?? [""]
                userEdit = docData!["userEdit"] as? String ?? ""
                self.singleWord = Word(word: word, pronunciation: pronunciation, definiton: definitions, audioUrl: audioUrl, wordForms: wordForms, userEdit: userEdit)
                print(self.singleWord.userEdit)
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
                    
        let documentId = db.collection(userCollection).document(authEmail).collection(userCollectionWords).document(wordChosen).documentID
        if documentId == wordChosen {
//            do {
//                try db.collection(userCollection).document(authEmail).collection(userCollectionWords).document(documentId).updateData(updateUserNote)
//                    getDetailOneWord(searchWord: wordChosen)
//                } catch {
//                    print(error)
//                  }
            do {
                try db.collection(userCollection).document(authEmail).collection(userCollectionWords).document(documentId).updateData(updateUserNote)
                self.getDetailOneWord(searchWord: wordChosen)
            } catch {
                print(error)
            }
        }
    }
    
    func deleteWord(wordChosen: String) {
        let documentId = db.collection(userCollection).document(authEmail).collection(userCollectionWords).document(wordChosen).documentID
        if documentId == wordChosen {
            do {
                try db.collection(userCollection).document(authEmail).collection(userCollectionWords).document(documentId).delete()
                self.listColWord.filter { word in
                    return word.word != wordChosen
                }
            }
                  catch {
                    print(error)
                  }
        }
    }

}
