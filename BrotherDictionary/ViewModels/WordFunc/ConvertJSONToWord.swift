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
    var userEdit = ""
    
    for def in word[0].meanings {
        defTemp = def.partOfSpeech
        wordForms.append(defTemp)
        for mean in def.definitions {
            meanTemp.append(mean.definition)
        }
        
        definitions[defTemp] = meanTemp
    }
	
	if word[0].phonetics.count > 0 {
		for phonetic in word[0].phonetics {
			if let pronun = phonetic.text {
				pronunciation = pronun
				audioUrl = phonetic.audio
				break
			}
		}
		
		if audioUrl == "" {
			audioUrl = word[0].phonetics[0].audio
		}
	}
    
    
    
    return Word(word: word[0].word, pronunciation: pronunciation,
                definiton: definitions, audioUrl: audioUrl, wordForms: wordForms, userEdit: userEdit)
}
