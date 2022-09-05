//
//  ConvertJSONToWord.swift
//  BrotherDictionary
//
//  Created by Nhat, Nguyen Hoang Minh on 05/09/2022.
//

import Foundation
func ConvertJSONtoWord(word: WordJSON)-> Word {
    var definitions: [String : [String]] = [:]
    var defTemp: String
    var meanTemp: [String] = []
    var wordForms: [String] = []
    var pronunciation = ""
    var audioUrl = ""
    
    
//    writeToFile()
    
    for def in word[0].meanings {
        defTemp = def.partOfSpeech
        wordForms.append(defTemp)
        for mean in def.definitions {
            meanTemp.append(mean.definition)
        }
        
        definitions[defTemp] = meanTemp
    }
    
    for phonetic in word[0].phonetics {
        if let pronun = phonetic.text {
            pronunciation = pronun
            audioUrl = phonetic.audio
            break
        }
    }
    
    return Word(word: word[0].word, pronunciation: pronunciation,
                definiton: definitions, audioUrl: audioUrl, wordForms: wordForms)
}
