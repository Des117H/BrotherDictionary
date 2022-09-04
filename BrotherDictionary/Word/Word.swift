/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tu Gia Dinh
  ID: 3891542
  Created  date: 04/09/2022
  Last modified:
  Acknowledgement:
 Canvas
*/

import Foundation

struct Word: Codable, Identifiable {
	var id = UUID()
	let word: String
	let pronunciation: String
	let definitions: [String: [String]]
	let audioUrl: String
	var userEdit: String?
	let wordForms: [String]
	
	init(word: String, pronunciation: String, definiton: [String: [String]], audioUrl: String, wordForms: [String]) {
		self.word = word
		self.pronunciation = pronunciation
		self.definitions = definiton
		self.audioUrl = audioUrl
		self.wordForms = wordForms
	}
}

func ConvertJSONtoWord(word: WordJSON)-> Word {
	var definitions: [String : [String]] = [:]
	var defTemp: String
	var meanTemp: [String] = []
	var wordForms: [String] = []
	var pronunciation = ""
	var audioUrl = ""
	
	
	writeToFile()
	
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
