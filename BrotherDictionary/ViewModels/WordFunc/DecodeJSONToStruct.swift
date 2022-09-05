//
//  DecodeJSONToStruct.swift
//  BrotherDictionary
//
//  Created by Nhat, Nguyen Hoang Minh on 05/09/2022.
//

import Foundation
func decoceJsonFileToStruct(wordSearch: String) -> WordJSON {
    if let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(wordSearch)") {
        if let data = try? Data(contentsOf: url) {
            do {
                return try JSONDecoder().decode(WordJSON.self, from: data)
            } catch let err {
                fatalError("Failed to encode JSON: \(err)")
            }
        }
    }
    
    return [WordElement(word: "",
                        phonetics: [Phonetic(audio: "", text: "")],
                        meanings: [Meaning(partOfSpeech: "",
                                           definitions: [Definition(definition: "")])
                        ])
    ]
}
