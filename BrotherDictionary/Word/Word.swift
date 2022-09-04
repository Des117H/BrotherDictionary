//
//  Word.swift
//  TestScrap
//
//  Created by Dinh Tu on 04/09/2022.
//

import Foundation

struct Word: Codable, Identifiable {
	let id = UUID()
	var word: String
	var definitions: [String: [String]]
	var sourceUrl: String
	var userEdit: String?
	var wordForms: [String]
	
	init(word: String, definiton: [String: [String]], sourceURL: String, wordForms: [String]) {
		self.word = word
		self.definitions = definiton
		self.sourceUrl = sourceURL
		self.wordForms = wordForms
	}
}

func ConvertJSONtoWord(word: WordJSON)-> Word {
	var definitions: [String : [String]] = [:]
	var defTemp: String
	var meanTemp: [String] = []
	var wordForms: [String] = []
	
	for def in word[0].meanings {
		defTemp = def.partOfSpeech
		wordForms.append(defTemp)
		for mean in def.definitions {
			meanTemp.append(mean.definition)
		}
		
		definitions[defTemp] = meanTemp
	}
	
	return Word(word: word[0].word, definiton: definitions, sourceURL: "", wordForms: wordForms)
}

func decoceJsonFileToStruct(wordSearch: String) -> WordJSON {
	if let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(wordSearch)") {
		if let data = try? Data(contentsOf: url) {
			do {
				let decoded = try JSONDecoder().decode(WordJSON.self, from: data)
				print(decoded)

				return decoded
			} catch let err {
				fatalError("Failed to encode JSON: \(err)")
			}
		}
	}

	fatalError("Failed to encode JSON")
}
